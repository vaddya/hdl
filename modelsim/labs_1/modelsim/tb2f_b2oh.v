`timescale 1ns/1ns
module tb2f_b2oh;

localparam period = 80;
localparam N = 3;

reg [N - 1:0] binary;
wire [2 ** N - 1:0] positional;
reg  [2 ** N - 1:0] expected;
reg clk;
integer i;
reg [N - 1:0] binary_mem [0:2 ** N];
reg [2 ** N - 1:0] expected_mem [0:2 ** N];
b2oh #(N) xxx(binary, positional);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("binary_b2oh.dat", binary_mem);
	$readmemb("expected_b2oh.dat", expected_mem);
end

initial begin
	$display("\t\t time binary positional");
	for (i = 0; i < 2 ** N; i = i + 1) begin
		@(posedge clk);
		binary = binary_mem[i];
		expected = expected_mem[i];
		@(negedge clk);
		$display($time,,,,binary,,,,positional);
		if (positional !== expected)
			$display("Error: expected %b, got %b.\n", expected, positional);
	end
	$display("Testing complited");
	$stop;
end

endmodule
