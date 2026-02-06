// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>
//
// Based on Reto Zimmerman Paper:
// Optimized Synthesis of Sum-of-Products (Figure 1)

module FmaShareSgn #(
    BW = 8
)
(
    input logic  signed [BW-1:0] a,
    input logic  signed [BW-1:0] b,
    input logic  signed [BW-1:0] c,
    input logic  signed [BW-1:0] d,
    output logic signed [2*BW-1:0] res_c,
    output logic signed [2*BW-1:0] res_d
);

assign res_c = a*b + c;
assign res_d = a*b + d;

endmodule