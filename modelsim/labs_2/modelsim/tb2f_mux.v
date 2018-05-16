`timescale 1ns/1ns
module tb2f_mux;

localparam period = 80;
localparam N = 3;
reg [N - 1:0] a, b;
reg sel, clk;
wire [N - 1:0] result;
reg  [N - 1:0] input_mem [0:29];
reg  [N - 1:0] expected_mem [0:9];
mux #(N) m(sel, a, b, result);

integer i, k;

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("input_mux.dat", input_mem);
	$readmemb("exp_mux.dat", expected_mem);
end

initial begin
	k = 0;
	$display("\t\t time sel a b result");
	for (i = 0; i < 30; i = i + 3) begin
		@(posedge clk);
		a = input_mem[i];
		b = input_mem[i + 1];
		sel = input_mem[i + 2];
		@(negedge clk);
		$display($time,,,, sel,,,, a,,,, b,,,, result);
		if (result !== expected_mem[k])
			$display("Expected %b, got %b.\n", expected_mem[k], result);
		k = k + 1;
	end
	$display("Testing complited");
	$stop;
end

endmodule
