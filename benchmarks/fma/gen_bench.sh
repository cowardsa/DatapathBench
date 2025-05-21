#!/bin/bash
# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "Error: No bitwidth specified"
    echo "Usage: $0 <integer>"
    exit 1
fi

# Check if the argument is an integer
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "Error: Bitwdith must be a positive integer"
    echo "Usage: $0 <integer>"
    exit 1
fi

# Store the integer argument
bw=$1

echo "Generating fma benchmark with bitwidth $bw"
circt-verilog sv/fma.sv -G BW=$bw -o mlir/fma.comb.mlir
circt-opt mlir/fma.comb.mlir --convert-comb-to-datapath --canonicalize -o mlir/fma.datapath.mlir
circt-lec mlir/fma.comb.mlir mlir/fma.datapath.mlir --c1 fma --c2 fma --emit-smtlib -o smtlib/fma.lec_BW_$bw.smt2