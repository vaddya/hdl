`timescale 1ns/1ns
module tb2_b2bd;

localparam period = 40;

reg [3:0] bin_code;
wire [7:0] bd_code;
reg [7:0] exp_bd_code;
reg clk;
integer i;
b2bd b(bin_code, bd_code);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$display("\t\t time bin_code bd_code");
	for (i = 0; i < 16; i = i + 1) begin
	@(posedge clk)
	bin_code = i;
	exp_bd_code [7:4] = i / 10;
	exp_bd_code [3:0] = i / 10;
	@(negedge clk)
	$display($time,,,, bin_code,,,, bd_code);
	if (bd_code !== exp_bd_code)
		$display("Expected %d, got %d.\n", exp_bd_code, bd_code);
	end
	$display("Testing complited");
	$stop;
end

endmodule