`timescale 1 ns/1 ns
module tb1_sums;

reg signed [2:0] a;
reg signed [2:0] b;
reg c_in;
wire c_out;
wire signed [2:0] res;

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

initial begin
	#640 $stop;
end

endmodule
