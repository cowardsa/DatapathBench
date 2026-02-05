// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>
//
// Implementation of a graphics alpha blending operation as described in
// DirectX specification

module AlphaBlend #(
    BW=8
) (
    input logic [BW-1:0] A,
    input logic [BW-1:0] B,
    input logic [BW-1:0] C,
    output logic [2*BW-1:0] D
);

logic [BW:0] one_minus_A;

assign one_minus_A = {1'b1, {BW{1'b0}}} - A;
assign           D = A*B + one_minus_A*C; 

endmodule
