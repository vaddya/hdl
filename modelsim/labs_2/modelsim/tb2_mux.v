`timescale 1ns/1ns
module tb2_mux;

localparam period = 80;
localparam N = 3;
reg [N - 1:0] a, b, expected;
reg sel, clk;
wire [N - 1:0] result;
mux #(N) m(sel, a, b, result);
integer i, j;

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	sel = 1'b0;
	expected = 4'b0000;
	$display("\t\t time sel a b result");
	for (i = 0; i < 2 ** N; i = i + 1) begin
	    for (j = 0; j < 2 ** N; j = j + 1) begin
			@(posedge clk);
			$display($time,,,, sel,,,, a,,,, b,,,, result);
			if (result !== expected)
				$display("Expected %b, got %b.\n", expected, result);
			@(negedge clk);
			a = i; 
			b = j;
			sel = ~sel;
			expected = sel ? b : a;
		end
	end
	$display("Testing complited");
	$stop;
end
endmodule
