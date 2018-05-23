`timescale 1ns / 1ns
module tb2f_labs_14;

reg clk;
reg [7:0] data;
wire [7:0] sorted;
reg [1:0] a, b, c, d;
reg [7:0] input_mem [0:9];
reg [7:0] exp_mem [0:9];
integer i;

lab7_1 #(0) t(data, sorted);

initial begin
	$readmemb("input_labs_14.dat", input_mem);
	$readmemb("exp_labs_14.dat", exp_mem);
end

initial begin	
	for (i = 0; i < 10; i = i + 1) begin
		data = input_mem[i];
		#5 {a, b, c, d} = sorted;
		if (sorted != exp_mem[i])
			$display("Expected (%d %d %d %d), got (%d %d %d %d)", 
				exp_mem[i][7:6], exp_mem[i][5:4], exp_mem[i][3:2], exp_mem[i][1:0], a, b, c, d);
	end
	$stop;
end

endmodule