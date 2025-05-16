module dot_prod_two #(
    BW = 16
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    output logic [2*BW-1:0] res
);

assign res = a*b + c*d;

endmodule