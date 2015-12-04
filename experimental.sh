#!/bin/bash
# This script runs the benchmarks with all of the experimental branch predictor implementations.

source benchmarks.sh

run_benchmarks 'experimental' "\
percept-1-2048-32=-bpred percept -bpred:2lev 1 2048 32 0,\
percept-1-1024-64=-bpred percept -bpred:2lev 1 1024 64 0,\
percept-1-512-128=-bpred percept -bpred:2lev 1 512 128 0,\
percept-64-2048-32=-bpred percept -bpred:2lev 64 2048 32 0,\
percept-64-1024-64=-bpred percept -bpred:2lev 64 1024 64 0,\
percept-64-512-128=-bpred percept -bpred:2lev 64 512 128 0,\
percept-1024-1024-32=-bpred percept -bpred:2lev 1024 1024 32 0,\
percept-1024-512-64=-bpred percept -bpred:2lev 1024 512 64 0,\
percept-1024-256-128=-bpred percept -bpred:2lev 1024 256 128 0"

# we want the size of the simulated predictor that we are implementing to be roughly 64KB
# order is always
# gagx3
# sagx3
# pagx3