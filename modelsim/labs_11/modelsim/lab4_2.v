module lab4_2(clk, aset, cnt_qout);
parameter MODULUS = 25_000_000;

input clk, aset;
output [3:0] cnt_qout;
reg [25:0] cnt_d;
reg [3:0] cnt_q;
wire ena;

cd #(3) d(clk, ena);
r re(clk, ena, aset, cnt_qout);

endmodule
