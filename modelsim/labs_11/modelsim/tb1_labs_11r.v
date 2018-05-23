`timescale 1ns/1ns
module tb1_labs_11r;

reg clk, ena, aset;
wire [3:0] cnt_qout;

r re(clk, ena, aset, cnt_qout);

initial begin
	aset = 0; ena = 0;
	#20 aset = 1;
	#20 ena = 1;
end

initial begin
	clk = 0;
	repeat(30) #5 clk = ~clk;
end

endmodule
