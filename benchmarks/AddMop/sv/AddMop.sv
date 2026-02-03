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
// Multi-operand adder using carry-save adder /array/tree and
// ripple-carry/parallel-prefix final adder.
// S = A[0]+A[1]+A[2]...+A[depth-1]

// NOTICE:
// Benchmark taken from: https://github.com/pulp-platform/ELAU/tree/master
// MODIFICATIONS: removal of unused speed parameter, and renamed width to BW

module AddMop #(
	parameter int              BW = 8,             // word BW
	parameter int              depth = 4           // number of operands
) (
	input  logic [(depth*BW)-1:0] A,  // operands
	output logic [        BW-1:0] S   // sum
);
	always_comb begin : reduction
		S = '0;
		for (int i = 0; i < depth; i++) begin
			S += A[BW*i +: BW];
		end
	end
endmodule
