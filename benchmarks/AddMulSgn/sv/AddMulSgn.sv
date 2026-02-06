// Copyright 2024 ETH Zurich and University of Bologna.
// Solderpad Hardware License, Version 0.51, see LICENSE for details.
// SPDX-License-Identifier: SHL-0.51
//
// Based on the work by Reto Zimmermann 1998 - ETH Zürich
// Originally written in VHDL, available under: 
// https://iis-people.ee.ethz.ch/~zimmi/arith_lib.html#library
//
// Authors:
// - Thomas Benz <tbenz@iis.ee.ethz.ch>
// - Philippe Sauter <phsauter@iis.ee.ethz.ch>
// - Paul Scheffler <paulsc@iis.ee.ethz.ch>
//
// Description :
// Adder-multiplier for signed numbers. First adds two numbers, then
// multiplies the result with the multiplicand. Can be used for multiplication
// with an input operand in carry-save number format. Result is only valid if
// sum does not overflow.
// P = (XS+XC)*Y

// NOTICE:
// Benchmark taken from: https://github.com/pulp-platform/ELAU/tree/master
// MODIFICATIONS: removal of unused speed parameter, hard coded all widths to 
// 				  depend on BW parameter

module AddMulSgn #(
	parameter int BW = 8,     // word width of XS, XC (<= widthY)
	parameter int widthX = BW,     // word width of Y
	parameter int widthY = BW     // word width of Y
) (
	input logic  signed [widthX-1:0] XS,  // multipliers
	input logic  signed [widthX-1:0] XC,
	input logic  signed [widthY-1:0] Y,  // multiplicand
	output logic signed [widthX+widthY-1:0] P  // product
);
	assign P = (XS + XC) * Y;
endmodule