`timescale 1ns/1ns
module tb2f_dmux;

localparam period = 80;
localparam N = 3;
reg sel, clk;
reg  [N - 1:0] data, result;
wire [N - 1:0] out1, out2;
reg  [N - 1:0] input_mem [0:19];
reg  [N - 1:0] result_mem [0:9];
dmux #(N) dm(data, sel, out1, out2);

integer i, k;

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("input_dmux.dat", input_mem);
	$readmemb("exp_dmux.dat", result_mem);
end

initial begin
	k = 0;
	$display("\t\t time data sel out1 out2");
	for (i = 0; i < 17; i = i + 2) begin
		@(posedge clk);
		data = input_mem[i];
		sel = input_mem[i + 1];
		@(negedge clk);
		result = out1 ? out1 : out2;
		$display($time,,,, data ,,, sel,,,, out1,,,, out2);
		if (result !== result_mem[k])
			$display("Expected %d, got %d.\n", result_mem[k], result);
		k = k + 1;
	end
	$display("Testing complited");
	$stop;
end

endmodule
