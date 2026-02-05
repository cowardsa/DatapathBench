// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>

module AddThree 
#(
    // Parameterized width for the inputs and output
    parameter BW = 8
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    output logic [BW:0] sum
);

    always_comb begin
        sum = a + b + c; // Adding 3 to the sum of a, b, and c
    end
endmodule
