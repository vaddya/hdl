`timescale 1 ns/1 ns
module tb2_sums;

reg signed [2:0] a;
reg signed [2:0] b;
reg c_in;
wire signed [2:0] res;
wire c_out;
reg signed [2:0] exp_res;
reg exp_c_out;

sum s({c_out, res}, a, b, c_in);

initial begin
	$display("\t\t time a b c_in sum c_out");
	$monitor($time,,, a,,, b,,, c_in,,, res,,, c_out);
	a = 3'b0;
	b = 3'b0;
	c_in  = 1'b0;
	forever begin
		#5 c_in = ~c_in;
		#5 {a, b} = {a, b} + 1'b1;
	end
end
  
always @* begin
	#0;
	{exp_c_out, exp_res} = a + b;// + c_in;
	if (res !== exp_res || c_out != exp_c_out)
		$display("Expected (%d,%d), got (%d,%d).\n", exp_c_out, exp_res, c_out, res);
end 

initial begin
	#640 $display("Testing complited");
	$stop;
end

endmodule
