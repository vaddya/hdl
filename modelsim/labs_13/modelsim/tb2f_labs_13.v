`timescale 1ns/1ns
module tb2f_labs_13;

reg clk;
reg [3:0] a, b;
wire [7:0] prod;
reg [7:0] input_mem [0:6];
reg [7:0] exp_mem [0:6];
integer i;

lab6_2 #(.N(4), .INV(0)) t(clk, {b, a}, prod);

initial begin
	$readmemh("input_labs_13.dat",input_mem);
	$readmemh("exp_labs_13.dat",exp_mem);
end

initial begin
	clk = 0;
	forever #(5) clk = ~clk;
end

initial begin
    a = 0; b = 0;
	repeat(2) @(posedge clk);
    for (i = 0; i < 7; i = i + 1) begin
		{a, b} = input_mem[i];
		repeat(10) @(posedge clk);
		if (prod != exp_mem[i])
			$display("Expected %d, got %d (%d %d)", exp_mem[i], prod, a, b);
	end
	$stop;
end

endmodule
