#!/bin/bash
# This script runs the benchmarks with all of the default branch predictor implementations.

source benchmarks.sh

run_benchmarks 'default' 'perfect=-bpred perfect,not-taken=-bpred nottaken,2-bit=-bpred bimod,combined=-bpred comb,two-level=-bpred 2lev'