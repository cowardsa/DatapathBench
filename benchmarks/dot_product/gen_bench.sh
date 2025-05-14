#!/bin/bash
circt-verilog dot_product.sv -G BW=16 -o dot_product.comb.mlir
# circt-opt dot_product.mlir --convert-comb-to-datapath --caononicalize -o dot_product.datapath.mlir
# circt-lec 