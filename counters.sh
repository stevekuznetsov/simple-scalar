#!/bin/bash
# This script runs sim-outorder for some set of benchmarks for the Alpha architecture,
# running each with some set of arguments. This script assumes it is run from the base
# directory of simple-scalar, and that the benchmark files live in a sub-directory
# named 'benchmarks'. The benchmarks are invoked with the following syntax:
#  - anagram    : sim-outorder ${arguments} anagram.alpha words < anagram.in
#  - compress95 : sim-outorder ${arguments} compress95.alpha < compress95.in
#  - gcc        : sim-outorder ${arguments} cc1.alpha -O 1stmt.i
#  - go         : sim-outorder ${arguments} go.alpha 50 9 2stone9.in

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


# navigate to benchmark directory
pushd benchmarks > /dev/null

# set up output test directory
test_name=$(echo $0 | grep -Po "[A-Za-z0-9]+(?=.sh)")
output_dir="output/${test_name}"
mkdir -p ${output_dir}

# clear whatever was in the test directory previously - we're going to write new output data
rm -rf ${output_dir}/*

benchmark_names=('anagram') 
benchmarks=('anagram.alpha words < anagram.in')

names=('perfect' 'four-bit' 'three-bit' 'two-bit' 'one-bit')
args=('-bpred perfect' '-bpred 4bit' '-bpred 3bit' '-bpred bimod' '-bpred 1bit')

# run all combinations of benchmarks and arguments
for (( i=0; i<${#benchmarks[@]}; i++ )); do
  for (( j=0; j<${#args[@]}; j++ )); do
    output_file="${benchmark_names[$i]}_${names[$j]}.txt"
    echo "Executing: 'sim-outorder ${args[$j]} ${benchmarks[$i]}' and storing the output at ${output_dir}/${output_file}"
    # hard-code anagram benchmark for now
    ./../sim-outorder ${args[$j]} anagram.alpha words < anagram.in > ${output_dir}/${output_file} 2>&1

    # extract useful metrics
    ipc=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # instructions per cycle)")
    echo "Instructions Per Cycle:    ${ipc}"
    addr_pred_rate=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # branch address-prediction rate)") || true
    echo "Address Prediction Rate:   ${addr_pred_rate:-1.0000}"
    dir_pred_rate=$(cat ${output_dir}/${output_file} | grep -Po "[0-9]+\.[0-9]+(?= # branch direction-prediction rate)") || true
    echo "Direction Prediction Rate: ${dir_pred_rate:-1.0000}"
    echo
  done
done

# return to previous location
popd > /dev/null