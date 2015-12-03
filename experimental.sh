#!/bin/bash
# This script runs the benchmarks with all of the experimental branch predictor implementations.

source benchmarks.sh

run_benchmarks 'experimental' 'percept=-bpred percept' #'-bpred oghel'