// Copyright 2025 University College London.
// MIT License License, see LICENSE for details.
//
// Authors:
// - Samuel Coward <sam.coward@ucl.ac.uk>
//
// Example taken from PULP Lab (Luca Benini) work:
// Insights from Basilisk: Are Open-Source EDA Tools Ready for a 
// Multi-Million-Gate, Linux-Booting RV64 SoC Design?

module FmaaSgn #(
    BW = 54
)
(
    input logic  signed [BW-1:0] a,
    input logic  signed [BW-1:0] b,
    input logic  signed [3*BW:0] c,
    input logic  signed [3*BW:0] d,
    output logic signed [3*BW:0] res
);

assign res = a*b - c - d;

endmodule
