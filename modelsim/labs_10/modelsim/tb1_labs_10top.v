`timescale 1 ns/ 1 ns
module tb1_labs_10top;

reg clk, aset, sclr, load, dir;
reg  [3:0] din;
wire [3:0] cnt_qout;
integer i;

lab4_1 t(clk, aset, sclr, load, dir, din, cnt_qout);

initial begin
	clk = 0;
	din = 2;
	for (i = 0; i < 2**8; i = i + 1) begin
		{aset, sclr, load, dir} = i[7:4]; 
		clk = i[0];
		#20;
	end
	{aset, sclr, load} = 3'b110;

	for (i = 0; i < 2**8; i = i + 1) begin
		dir = i[7];
		clk = i[0];
		#20;
	end
end

endmodule
