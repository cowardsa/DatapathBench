// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>

module FmaSgn #(
    BW = 8
)
(
    input logic   signed [BW-1:0] a,
    input logic   signed [BW-1:0] b,
    input logic   signed [BW-1:0] c,
    output logic  signed [2*BW-1:0] res
);

assign res = a*b - c;   

endmodule