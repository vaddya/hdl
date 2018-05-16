`timescale 1ns/1ns
module tb2f_b2bd;

localparam period = 40;

reg [3:0] bin_code;
wire [7:0] bd_code;
reg [3:0] input_mem [0:15];
reg [7:0] exp_mem [0:15];
reg clk;
integer i;
b2bd b(bin_code, bd_code);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("input_b2bd.dat", input_mem);
	$readmemb("exp_b2bd.dat", exp_mem);
end

initial begin
	$display("\t\t time bin_code bd_code");
	for (i = 0; i < 16; i = i + 1) begin
		@(posedge clk)
		bin_code = input_mem[i];
		@(negedge clk)
		$display($time,,,, bin_code,,,, bd_code);
		if (bd_code !== exp_mem[i])
			$display("Expected %d, got %d.\n", exp_mem[i], bd_code);
	end
	$display("Testing complited");
	$stop;
end

endmodule
