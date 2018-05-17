`timescale 1ns/1ns
module tb2f_b27s;

localparam period = 40;

wire [7:0] seg;
reg [3:0] bin_code;
reg [3:0] input_mem [0:15];
reg [7:0] exp_mem [0:15];
reg clk;
integer i;
b27s b(bin_code, seg);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("input_b27s.dat", input_mem);
	$readmemb("exp_b27s.dat", exp_mem);
end

initial begin
	$display("\t\t  time  bin_code segments");
	for (i = 0; i < 16; i = i + 1) begin 
		@(posedge clk)
		bin_code = input_mem[i];
		@(negedge clk)
		$display($time,,,, bin_code,,,, seg);
		if (seg !== exp_mem[i])
			$display("Expected %d, got %d.\n", exp_mem[i], seg);
	end
	$display("Testing complited");
	$stop;
end

endmodule