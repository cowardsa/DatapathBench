// Benchmark taken from:
// RTL Coding Guidelines for Datapath Synthesis (Reto Zimmerman)
// https://picture.iczhiku.com/resource/eetop/wyiEELySpYPudnxV.pdf

module CarrySaveSelect #(
    BW = 8
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    input logic [BW-1:0] e,
    input logic sel,
    output logic [BW-1:0] res
);

assign res = (sel ? a*b : c*d) + e; 

endmodule