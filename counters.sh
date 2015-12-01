#!/bin/bash
# This script runs the benchmarks with all of the saturating bit counter branch predictor implementations.

source benchmarks.sh

run_benchmarks 'counters' '1-bit=-bpred 1bit,3-bit=-bpred 3bit,4-bit=-bpred 4bit,5-bit=-bpred 5bit,6-bit=-bpred 6bit'