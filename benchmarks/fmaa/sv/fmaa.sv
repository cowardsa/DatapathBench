// Example taken from Luca Benini's work:
// https://arxiv.org/pdf/2405.04257
//
module fmaa #(
    BW = 54
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [3*BW:0] c,
    input logic [3*BW:0] d,
    output logic [3*BW:0] res
);

assign res = a*b + c + d;

endmodule
