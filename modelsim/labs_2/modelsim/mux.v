module mux(sel, a, b, out);

parameter N = 3;

input sel;
input [N - 1:0] a, b;
output [N - 1:0] out;

wire [N - 1:0] res1, res2;

and u1 [N - 1:0] (res1, a, ~sel);
and u2 [N - 1:0] (res2, b, sel);
or  u3 [N - 1:0] (out, res1, res2);

endmodule
