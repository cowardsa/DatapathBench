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

echo "Generating dot product benchmark with bitwidth $bw"
circt-verilog sv/dot_prod_two.sv -G BW=$bw -o mlir/dot_prod_two.comb.mlir
circt-opt mlir/dot_prod_two.comb.mlir --convert-comb-to-datapath --canonicalize -o mlir/dot_prod_two.datapath.mlir
circt-lec mlir/dot_prod_two.comb.mlir mlir/dot_prod_two.datapath.mlir --c1 dot_prod_two --c2 dot_prod_two --emit-smtlib -o smtlib/dot_prod_two.lec_BW_$bw.smt2

