// Benchmark taken from:
// RTL Coding Guidelines for Datapath Synthesis (Reto Zimmerman)
// https://picture.iczhiku.com/resource/eetop/wyiEELySpYPudnxV.pdf

module CarrySaveSelectSgn #(
    BW = 8
)
(
    input logic signed [BW-1:0] a,
    input logic signed [BW-1:0] b,
    input logic signed [BW-1:0] c,
    input logic signed [BW-1:0] d,
    input logic signed [BW-1:0] e,
    input logic sel,
    output logic signed [BW-1:0] res
);

assign res = (sel ? a*b : c*d) + e;

endmodule
