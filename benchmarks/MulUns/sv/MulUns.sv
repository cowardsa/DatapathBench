// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>

module MulUns #(
    BW = 8
)
(
    input logic   [BW-1:0] a,
    input logic   [BW-1:0] b,
    output logic  [2*BW-1:0] res
);

assign res = a*b;   

endmodule