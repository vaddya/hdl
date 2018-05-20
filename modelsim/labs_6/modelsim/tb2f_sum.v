`timescale 1 ns/1 ns
module tb2f_sum;

reg [2:0] a;
reg [2:0] b;
reg c_in;
wire [3:0] res;
reg [6:0] input_mem [0:127];
reg [3:0] exp_mem [0:127];
integer i;

sum s(res, a, b, c_in);

initial begin
	$readmemb("input_sum.dat", input_mem);
	$readmemb("exp_sum.dat", exp_mem);
end

initial begin
	$display("\t\t time a b c_in sum c_out");
	$monitor($time,,, a,,, b,,, c_in,,, res[2:0],,, res[3]);
	for (i = 0; i < 128; i = i + 1) begin 
		{a, b, c_in} = input_mem[i];
		#0;
		if (res !== exp_mem[i])
			$display("Expected %d, got %d.\n", exp_mem[i], res);
		#5;
	end
end

initial begin
	#640 $display("Testing complited");
	$stop;
end

endmodule
