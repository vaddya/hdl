`timescale 1 ns/1 ns
module tb2f_sums;

reg signed [2:0] a;
reg signed [2:0] b;
reg c_in;
wire signed [2:0] res;
wire c_out;
reg [6:0] input_mem [0:127];
reg signed [3:0] exp_mem [0:127];
integer i;

sum s({c_out, res}, a, b, c_in);

initial begin
	$readmemb("input_sums.dat", input_mem);
	$readmemb("exp_sums.dat", exp_mem);
end

initial begin
	$display("\t\t time a b c_in sum c_out");
	$monitor($time,,, a,,, b,,, c_in,,, res,,, c_out);
	for (i = 0; i < 128; i = i + 1) begin 
		{a, b, c_in} = input_mem[i];
		#0;
		if ({c_out, res} !== exp_mem[i])
			$display("Expected %d, got %d.\n", exp_mem[i], {c_out, res});
		#5;
	end
end

initial begin
	#640 $display("Testing complited");
	$stop;
end

endmodule
