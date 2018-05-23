`timescale 1ns/1ns
module tb2_labs_13;

reg clk;
reg [3:0] a, b;
wire [7:0] prod;
reg [7:0] exp_prod;
integer i, j;

lab6_2 #(.N(4), .INV(0)) t(clk, {b, a}, prod);

initial begin
	clk = 0;
	forever #(5) clk = ~clk;
end
	
initial begin
	a = 0; b = 0;
	repeat(2) @(posedge clk);	
	for (i = 0; i < 16; i = i + 1) begin
		for (j = 0; j < 16; j = j + 1) begin
			a = i; b = j;
			repeat(10) @(posedge clk);
			exp_prod = a * b;
			if (prod != exp_prod)
				$display("Expected %d, got %d (%d %d)", exp_prod, prod, a, b);
		end
	end
	$stop;
end

endmodule
