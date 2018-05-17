`timescale 1ns/1ns
module tb1_b27s;

reg  [3:0] bin_code;
wire [7:0] seg;
b27s b(bin_code, seg);

initial begin
	$display("\t\t time bin_code segments");
	$monitor($time,,,, bin_code,,,, seg);
	#00 bin_code <= 4'd0;
	#40 bin_code <= 4'd3;
	#40 bin_code <= 4'd6;
	#40 bin_code <= 4'd9;
	#40 bin_code <= 4'd12;
	#40 $stop;
end

endmodule
