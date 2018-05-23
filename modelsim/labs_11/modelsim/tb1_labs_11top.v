`timescale 1ns/1ns
module tb1_labs_11top;

reg clk, aset;
wire [3:0] result;

lab4_2 t(clk, aset, result);

initial begin
	aset = 0;
	#20 aset = 1;
end

initial begin
	clk = 0;
	repeat(30) #5 clk = ~clk;
end

endmodule
