#!/bin/bash

set -e errexit 
set -e pipefail
set -e nounset 

# we are at /benchmarks/output

files=( $(find -name '*.txt') )

output_file='data.csv'
name_header=$(printf '%40s' 'TEST NAME')
sim_num_ins_header=$(printf '%12s' 'INSTRUCTIONS')
sim_num_branches_header=$(printf '%12s' 'BRANCHES')
sim_IPC_header=$(printf '%9s' 'IPC')
sim_IPB_header=$(printf '%9s' 'IPB')
bpred_addr_rate_header=$(printf '%9s' 'ADDR RATE')
bpred_dir_rate_header=$(printf '%9s' 'DIR RATE')
echo "$name_header, $sim_num_ins_header, $sim_num_branches_header, $sim_IPC_header, $sim_IPB_header, $bpred_addr_rate_header, $bpred_dir_rate_header" > $output_file

for file in "${files[@]}"; do
	echo $file
	name=$(echo $file | grep -Po "(?<=/)[^/]+(?=.txt)")

	if cat $file | grep -q "divide by zero"; then
		# corrupted file
		continue
	fi

	# metrics we want
	sim_num_insn=''     # total number of instructions
	sim_num_branches='' # number of branches
	sim_IPC=''          # instructions per cycle
	sim_IPB=''          # instructions per branch
	bpred_addr_rate=''  # branch address prediction success rate
	bpred_dir_rate=''   # branch direction prediction success rate

	sim_num_insn=$(grep -Po --text "[0-9]+(?= # total number of instructions committed)" $file)
	sim_num_branches=$(grep -Po --text "[0-9]+(?= # total number of branches committed)" $file)
	sim_IPC=$(grep -Po --text "[0-9]+\.[0-9]+(?= # instructions per cycle)" $file)
	sim_IPB=$(grep -Po --text "[0-9]+\.[0-9]+(?= # instruction per branch)" $file)

	if echo $name | grep -q perfect; then
		# -bpred perfect isn't an actual branch predictor, so it doesn't contain the metrics we want
		bpred_addr_rate='100.0000'
		bpred_dir_rate='100.0000'
	else
		bpred_addr_rate=$(grep -Po --text "[0-9]+\.[0-9]+(?= # branch address-prediction rate)" $file)
		bpred_dir_rate=$(grep -Po --text "[0-9]+\.[0-9]+(?= # branch direction-prediction rate)" $file)
	fi

	# format things nicely
	name_fmt=$(printf '%40s' $name)
	sim_num_insn_fmt=$(printf '%12d' $sim_num_insn)
	sim_num_branches_fmt=$(printf '%12d' $sim_num_branches)
	sim_IPC_fmt=$(printf '%9.4f' $sim_IPC)
	sim_IPB_fmt=$(printf '%9.4f' $sim_IPB)
	bpred_addr_rate_fmt=$(printf '%9.4f' $bpred_addr_rate)
	bpred_dir_rate_fmt=$(printf '%9.4f' $bpred_dir_rate)

	echo "$name_fmt, $sim_num_insn_fmt, $sim_num_branches_fmt, $sim_IPC_fmt, $sim_IPB_fmt, $bpred_addr_rate_fmt, $bpred_dir_rate_fmt" >> $output_file
done
