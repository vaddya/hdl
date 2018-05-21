`timescale 1ns / 1ns
module tb2_labs_8;

reg [3:0] a;
reg [3:0] b;
wire [3:0] max;
reg [3:0] exp_max;
lab3_3 t(a, b, max);

initial begin
	{a, b} = 0;
	forever #5 {a, b} = {a, b} + 1;
end

always @* begin
	$timeformat(-9, 0, "ns", 5);
	#0 exp_max = (a > b) ? a : b;
	if (max !== exp_max)
		$display("Expected %d, got %d (%d, %d)", exp_max, max, a, b);
end

initial begin
	#1280 $stop;
end

endmodule
