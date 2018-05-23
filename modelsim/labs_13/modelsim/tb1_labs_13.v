`timescale 1ns/1ns
module tb1_labs_13;

reg clk;
reg [3:0] a, b;
wire [7:0] prod;
integer tb1_;

lab6_2 #(.N(4), .INV(0)) t(clk, {b, a}, prod);

initial begin
	clk = 0;
	forever #(5) clk = ~clk;
end

initial begin 
    tb1_ = $fopen("tb1_.dat");
	$fwrite(tb1_, "\t time a b prod\n");
    $timeformat(-9, 0, " ns", 7);
    $fmonitor(tb1_, "%t %d %d %d", $time, a, b, prod);
end

initial begin
	a = 0; b = 0;
	repeat(2) @(posedge clk);
	a = 5; b = 2;
	repeat(10) @(posedge clk);
	a = 4; b = 10;
	repeat(10) @(posedge clk);
	a = 15; b = 15;
	repeat(10) @(posedge clk);
	$fclose(tb1_);
	$stop;
end

endmodule
