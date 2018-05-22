`timescale 1 ns/ 1 ns
module tb1_labs_10cd;

reg clk;
wire cout;

cd #(3) d(clk, cout);

initial begin
	clk = 0;
	repeat(100) #10 clk = ~clk;
end

initial begin
	#1000 $stop;
end

endmodule
