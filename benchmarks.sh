#!/bin/bash
# This script runs sim-outorder for some set of benchmarks for the Alpha architecture,
# running each with some set of arguments. This script assumes it is run from the base
# directory of simple-scalar, and that the benchmark files live in a sub-directory
# named 'benchmarks'. The benchmarks are invoked with the following syntax:
#  - anagram    : sim-outorder ${arguments} anagram.alpha words < anagram.in
#  - compress95 : sim-outorder ${arguments} compress95.alpha < compress95.in
#  - gcc        : sim-outorder ${arguments} cc1.alpha -O 1stmt.i
#  - go         : sim-outorder ${arguments} go.alpha 50 9 2stone9.in
# If the SPEC2000 flag is set, the script will run all of the SPEC benchmarks with an
# initial window of 20M ignored instructions and a benchmark window of 50M instructions.

set -e errexit  # force script to exit if any command fails
set -e pipefail # force script to exit if any part of a pipe fails
set -e nounset  # force script to exit if an uninitialized variable is referenced

# error is a function that determines in the script failed and makes that fact a little more obvious
function error() {
  exit_code=$?
  if [ ${exit_code} -ne 0 ]; then
    echo "FAILURE: $0 exited with exit code ${exit_code}"
  fi
  exit ${exit_code}
}

# we want to call error when the script exits or is interrupted
trap error EXIT SIGINT

function run_benchmarks() {
  local suite_name=$1
  local tests=$2

  # navigate to benchmark directory
  pushd benchmarks > /dev/null

  # set up output test directory
  output_dir="output/${suite_name}"
  mkdir -p ${output_dir}

  # clear whatever was in the test directory previously - we're going to write new output data
  rm -rf ${output_dir}/*

  benchmark_names=('anagram'    \
                   'compress95' \
                   'gcc'        \
                   'go') 
  benchmarks=('anagram.alpha words < anagram.in' \
              'compress95.alpha < compress95.in' \
              'cc1.alpha -O 1stmt.i'             \
              'go.alpha 50 9 2stone9.in')

  raw_tests=()
  test_names=()
  test_args=()
  IFS=',' read -ra raw_tests <<< "${tests}"
  for data in "${raw_tests[@]}"; do
    parts=()
    IFS='=' read -ra parts <<< "${data}"
    test_names+=("${parts[0]}")
    test_args+=("${parts[1]}")
  done

  # run all combinations of benchmarks and arguments
  for (( i=0; i<${#benchmarks[@]}; i++ )); do
    for (( j=0; j<${#test_args[@]}; j++ )); do
      output_file="${benchmark_names[$i]}_${test_names[$j]}.txt"
      echo "Executing: 'sim-outorder ${test_args[$j]} ${benchmarks[$i]}' and storing the output at ${output_dir}/${output_file}"
      eval "./../sim-outorder ${test_args[$j]} ${benchmarks[$i]}" > ${output_dir}/${output_file} 2>&1

      # extract useful metrics
      ipc=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # instructions per cycle)")
      echo "Instructions Per Cycle:    ${ipc}"
      if [ "${test_names[$j]}" = "perfect" ]; then
        # perfect isn't actually a branch predictor, so it doesn't output info
        addr_pred_rate=1.000
        dir_pred_rate=1.000
      else
        addr_pred_rate=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # branch address-prediction rate)")
        dir_pred_rate=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # branch direction-prediction rate)")
      fi
      echo "Address Prediction Rate:   ${addr_pred_rate}"
      echo "Direction Prediction Rate: ${dir_pred_rate}"
      echo
    done
  done

  if [[ -n "${SPEC2000}" ]]; then
    output_dir="output/spec2000/${suite_name}"
    mkdir -p "${output_dir}"
    rm -rf "${output_dir}/*"

    benchmarks=( $(ls -d SPEC2000/spec2000args/* | grep -Po "(?<=spec2000args/).*") )
    for benchmark in "${benchmarks[@]}"; do
      pushd SPEC2000/spec2000args/${benchmark} > /dev/null
      for (( i=0; i<${#test_args[@]}; i++ )); do
        binary="./../../spec2000binaries/${benchmark}00.peak.ev6"
        run="./RUN${benchmark}"

        echo "Running ${run} './../../../../sim-outorder ${test_args[$i]}' ${binary} -fastfwd 20000000 -max:inst 50000000 > ./../../../${output_dir}/${benchmark}_${test_names[$i]}.txt 2>&1"
        eval time "${run} './../../../../sim-outorder ${test_args[$i]}' ${binary} -fastfwd 20000000 -max:inst 50000000" > ./../../../${output_dir}/${benchmark}_${test_names[$i]}.txt 2>&1
      done
      popd > /dev/null
    done
  fi
  # return to previous location
  popd > /dev/null
}

