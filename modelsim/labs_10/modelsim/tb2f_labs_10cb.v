`timescale 1ns / 1ns
module tb2f_labs_10cb;

reg clk, ena, aset, sclr, load, dir;
reg [3:0] din;
wire [3:0] cnt_qout;
reg [8:0] input_mem [0:49];
reg [3:0] exp_mem [0:49];
integer i;

cb b(clk, ena, aset, sclr, load, dir, din, cnt_qout);

initial begin
	$readmemb("input_labs_10cb.dat", input_mem);
	$readmemb("exp_labs_10cb.dat", exp_mem);
end

initial begin
	clk = 0;
	forever #(5) clk = ~clk;
end

initial begin
	#0 for (i = 0; i < 50; i = i + 1) begin
		@(posedge clk); 
		{sclr, aset, din, load, dir, ena} = input_mem[i];
		@(negedge clk);
		if (cnt_qout != exp_mem[i])
			$display("Eexpected %d, got %d", exp_mem[i], cnt_qout);
	end
i	$stop;
end

endmodule
