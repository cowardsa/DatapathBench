// Benchmark taken from:
// RTL Coding Guidelines for Datapath Synthesis (Reto Zimmerman)
// https://picture.iczhiku.com/resource/eetop/wyiEELySpYPudnxV.pdf

module CarrySaveCompare #(
    BW = 8
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    output logic res
);

logic [BW:0] t1;
logic [2*BW-1:0] t2;

assign t1 = a + b;
assign t2 = c * d;
assign res = t1 > t2; 

endmodule