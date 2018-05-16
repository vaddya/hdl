`timescale 1ns/1ns
module tb2_b2oh;
localparam period = 80;
localparam N = 3;
reg [N - 1:0] binary;
wire [2 ** N - 1:0] positional;
reg  [2 ** N - 1:0] expected;
reg clk;
integer i;
b2oh #(N) bin2pos(binary, positional);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	binary = 3'b0;
	expected = 8'b00000001;
	$display("\t\t time binary positional");
	for (i = 0; i < 2 ** N; i = i + 1) begin
		@(posedge clk);
		$display($time,,,,binary,,,,positional);
		if (positional !== expected)
			 $display("Expected %b, got %b.\n", expected, positional);
		@(negedge clk);
		binary = binary + 1;
		expected = expected << 1;
	end
	$display("Testing complited");
	$stop;
end

endmodule
	