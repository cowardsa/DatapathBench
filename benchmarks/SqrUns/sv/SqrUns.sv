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
// Squarer for unsigned numbers using optimized partial-product generation,
// carry-save adder and final adder.
// P = X^2

// NOTICE:
// Benchmark taken from: https://github.com/pulp-platform/ELAU/tree/master
// MODIFICATIONS: removal of unused speed parameter, renamed width to BW

module SqrUns #(
	parameter BW = 8
) (
	input  logic [  BW-1:0] X,  // operand
	output logic [2*BW-1:0] P   // product
);
	assign P = X*X;
endmodule