// Copyright 2026 University College London.
// MIT License License, see LICENSE for details.

module WeightedSumSgn #(
    parameter BW = 8
)
(
    input  logic signed [BW-1:0] a,
    input  logic signed [BW-1:0] b,
    input  logic signed [BW-1:0] c,
    input  logic signed [BW-1:0] d,
    input  logic signed [BW-1:0] e,
    input  logic signed [BW-1:0] f,
    input  logic signed [BW-1:0] g,
    output logic signed [2*BW-1:0] z
);

assign z = a * b + c * d - 483 * e + f - g + 2918;

endmodule
