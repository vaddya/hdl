`timescale 1ns / 1ns
module tb2f_labs_12;

reg clk, aclr;
reg [1:0] data;
wire [2:0] result;
reg [2:0] input_mem [0:7];
reg [2:0] exp_mem [0:7];
integer i;

lab5_2 #(.N(1)) t(clk, aclr, data, result);
	
initial begin
	$readmemb("input_labs_12.dat", input_mem);
	$readmemb("exp_labs_12.dat", exp_mem);
end
	
initial begin
    clk = 0;
    forever #(10) clk = ~clk;
end

initial begin
	for (i = 0; i < 8; i = i + 1) begin
		@(negedge clk);
		{aclr, data} = input_mem[i];
		@(posedge clk);
		if (result != exp_mem[i])
			$display("Expected %d, got %d", exp_mem[i], result);
	end
	$stop;
end

endmodule
