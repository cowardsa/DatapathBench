// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>
//
// Example taken from PULP Lab (Luca Benini) work:
// Insights from Basilisk: Are Open-Source EDA Tools Ready for a 
// Multi-Million-Gate, Linux-Booting RV64 SoC Design?

module Fmaa #(
    BW = 54
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [3*BW:0] c,
    input logic [3*BW:0] d,
    output logic [3*BW:0] res
);

assign res = a*b + c + d;

endmodule
