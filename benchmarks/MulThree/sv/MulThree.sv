module MulThree #(
    parameter BW = 8
)  // Parameterized width for the multiplier
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    output logic [BW-1:0] product
);  

    always_comb begin
        product = a * b * c;
    end
endmodule