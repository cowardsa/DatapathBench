// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>
//
// Implementation of a graphics alpha blending operation as described in
// DirectX specification

module AlphaBlendSgn #(
    BW=8
) (
    input logic [BW-1:0] A,
    input logic signed [BW-1:0] B,
    input logic signed [BW-1:0] C,
    output logic signed [2*BW-1:0] D
);

logic signed [BW:0] one_minus_A;

assign one_minus_A = {1'b1, {BW{1'b0}}} - {1'b0,A};
assign           D = $signed({1'b0,A})*B + one_minus_A*C;

endmodule
