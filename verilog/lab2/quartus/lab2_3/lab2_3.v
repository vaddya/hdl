module lab2_3(a, b, res_div, res_mod);

input [3:0] a, b;
output [3:0] res_div, res_mod;

assign res_div = a / b;
assign res_mod = a % b;

endmodule
