module dot_prod_two #(
    BW = 8
)
(
    input logic [BW-1:0] a,
    input logic [BW-1:0] b,
    input logic [BW-1:0] c,
    input logic [BW-1:0] d,
    output logic [2*BW-1:0] res
);

logic [2*BW-1:0] ab_array [BW-1:0];
logic [2*BW-1:0] cd_array [BW-1:0];

// Generate the partial products
genvar i;
generate
    for (i = 0; i < BW; i++) begin : gen_ab
        assign ab_array[i] = a[i] ? b << i : '0;
        assign cd_array[i] = c[i] ? d << i : '0;
    end
endgenerate

// Sum the partial products
logic [2*BW-1:0] sum;
integer j;
always_comb begin
    sum = 0;
    for (j = 0; j < BW; j++) begin : sum_ab_gen
        sum = sum + ab_array[j];
    end
    for (j = 0; j < BW; j++) begin : sum_cd_gen
        sum = sum + cd_array[j];
    end
end

logic [2*BW-1:0] comp_0, comp_1;
assume property (sum == comp_0 + comp_1);

assign res = comp_0 + comp_1;


endmodule