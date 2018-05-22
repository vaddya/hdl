`timescale 1ns / 1ns
module tb2f_labs_10top;

reg clk, aset, sclr, load, dir;
reg [3:0] din;
wire [3:0] cnt_qout;
reg [8:0] input_mem [0:49];
reg [3:0] exp_mem [0:49];
integer i;

lab4_1 t(clk, aset, sclr, load, dir, din, cnt_qout);

initial begin
	$readmemb("input_labs_10top.dat", input_mem);
	$readmemb("exp_labs_10top.dat", exp_mem);
end

initial begin
	clk = 0;
	forever #(5) clk = ~clk;
end

initial begin
	#0 for (i = 0; i < 50; i = i + 1) begin
		@(posedge clk); 
		{sclr, aset, din, load, dir} = input_mem[i];
		@(negedge clk);
		if (cnt_qout != exp_mem[i])
			$display("Eexpected %d, got %d", exp_mem[i], cnt_qout);
	end
	$stop;
end

endmodule
