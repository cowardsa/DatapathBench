module blend #(
    BW=8
    // BW_BC=8,
    // BW_D=BW_A + BW_BC
) (
    input logic [BW-1:0] A,
    input logic [BW-1:0] B,
    input logic [BW-1:0] C,
    output logic [2*BW-1:0] D
);

logic [BW:0] one_minus_A;

assign one_minus_A = {1'b1, {BW{1'b0}}} - A;
assign           D = A*B + one_minus_A*C; 

endmodule
