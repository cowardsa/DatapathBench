// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>

module MulThreeSgn #(
    parameter BW = 8
)  // Parameterized width for the multiplier
(
    input logic  signed [BW-1:0]   a,
    input logic  signed [BW-1:0]   b,
    input logic  signed [BW-1:0]   c,
    input logic  signed [BW-1:0]   d,
    output logic signed  [BW-1:0]  product
);  

    always_comb begin
        product = a * b * c;
    end
endmodule