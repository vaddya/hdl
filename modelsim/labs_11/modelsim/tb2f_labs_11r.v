`timescale 1ns/ 1ns
module tb2f_labs_11r;

reg clk, ena, aset;
wire [3:0] cnt_qout;
reg [1:0] input_mem [0:6];
reg [3:0] exp_mem [0:6];
integer i;

r re(clk, ena, aset, cnt_qout);

initial begin
	$readmemb("input_labs_11r.dat", input_mem);
	$readmemb("exp_labs_11r.dat", exp_mem);
end

initial begin
	clk = 0;
    forever #(20) clk = ~clk;
end

initial begin
	#0 for (i = 0; i < 7; i = i + 1) begin
		@(posedge clk); 
		{aset, ena} = input_mem[i];
		@(negedge clk);
		if (cnt_qout != exp_mem[i])
			$display("Expected %d, got %d", exp_mem[i], cnt_qout);
	end
	$stop;
end

endmodule
