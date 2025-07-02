// Based on Reto Zimmerman Paper:
// Optimized Synthesis of Sum-of-Products
module fma_share #(
    BW = 16
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    output logic [2*BW-1:0] res_c,
    output logic [2*BW-1:0] res_d
);

assign res_c = a*b + c;
assign res_d = a*b + d;

endmodule