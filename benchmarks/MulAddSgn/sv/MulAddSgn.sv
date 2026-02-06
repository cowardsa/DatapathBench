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
// Multiplier-adder for signed numbers. First multiplies two numbers,
// then adds an additional operand to the result.
// P = (X*Y) +A

// NOTICE:
// Benchmark taken from: https://github.com/pulp-platform/ELAU/tree/master
// MODIFICATIONS: removal of unused speed parameter, hard coded all widths to 
// 				  depend on BW parameter
module MulAddSgn #(
	parameter BW = 8,
	parameter int              widthX = BW,             // word width of XS, XC (<= widthY)
	parameter int              widthY = BW,             // word width of Y
	parameter int              widthA = 2*BW            // word width of A (>= widthX+widthY)
) (
	input  logic signed [widthX-1:0] X,  // multiplier
	input  logic signed [widthY-1:0] Y,  // multiplicand
	input  logic signed [widthA-1:0] A,  // augend
	output logic signed [widthA-1:0] P   // product
);
	assign P = (X * Y) + A;
endmodule