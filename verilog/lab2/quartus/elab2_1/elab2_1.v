module elab2_1(a, b, res_div, res_frac);

input [3:0] a, b;
output [3:0] res_div, res_frac;

assign {res_div, res_frac} = {a, 4'h0} / b;

endmodule
