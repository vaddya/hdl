`timescale 1 ns/ 1 ns
module tb1_labs_10cb; 

reg clk, aset, sclr, load, dir, cout;
reg  [3:0] din;
wire [3:0] result;
integer i;

cb b(clk, cout, aset, sclr, load, dir, din, result);

initial begin
	clk = 0;
	din = 1010;
	for (i = 0; i < 2**8; i = i + 1) begin
		#20 {aset, sclr, load, dir} = i[7:4]; 
		{cout, clk} = i[1:0];
	end
end

endmodule
