module lab4_1(clk, aset, sclr, load, dir, din, cnt_qout);
parameter MOD = 3;
input clk, aset, sclr, load, dir;
input [3:0] din;
output [3:0] cnt_qout;
wire ena;

cd #(MOD) d(clk, ena);
cb b(clk, ena, aset, sclr, load, dir, din, cnt_qout);

endmodule
