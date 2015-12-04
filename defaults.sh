#!/bin/bash
# This script runs the benchmarks with all of the default branch predictor implementations.

source benchmarks.sh

run_benchmarks 'default' "perfect=-bpred perfect,not-taken=-bpred nottaken,2-bit=-bpred bimod,\
combined-1-65536-17-0=-bpred comb -bpred:2lev 1 65536 17 0,\
combined-1-65536-17-1=-bpred comb -bpred:2lev 1 65536 17 1,\
combined-1-65536-12-0=-bpred comb -bpred:2lev 1 65536 12 0,\
combined-64-65536-17-0=-bpred comb -bpred:2lev 64 65536 17 0,\
combined-64-65536-12-0=-bpred comb -bpred:2lev 64 65536 12 0,\
combined-1024-65536-17-0=-bpred comb -bpred:2lev 1024 65536 17 0,\
combined-1024-65536-12-0=-bpred comb -bpred:2lev 1024 65536 12 0,\
two-level-1-65536-17-0=-bpred 2lev -bpred:2lev 1 65536 17 0,\
two-level-1-65536-17-1=-bpred 2lev -bpred:2lev 1 65536 17 1,\
two-level-1-65536-12-0=-bpred 2lev -bpred:2lev 1 65536 12 0,\
two-level-64-65536-17-0=-bpred 2lev -bpred:2lev 64 65536 17 0,\
two-level-64-65536-12-0=-bpred 2lev -bpred:2lev 64 65536 12 0,\
two-level-1024-65536-17-0=-bpred 2lev -bpred:2lev 1024 65536 17 0,\
two-level-1024-65536-12-0=-bpred 2lev -bpred:2lev 1024 65536 12 0"

# we want the size of the simulated predictor that we are implementing to be roughly 64KB
# order is always
# gag
# gas
# sag
# sas
# pag
# pas