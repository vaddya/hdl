module dmux(data, sel, out1, out2);

parameter N = 4;

input [N - 1:0] data;
input sel;
output [N - 1:0] out1, out2;

and a1 [N - 1:0] (out1, data, sel);
and a2 [N - 1:0] (out2, data, ~sel);

endmodule
