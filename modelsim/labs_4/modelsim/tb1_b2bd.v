`timescale 1ns/1ns
module tb1_b2db;

reg [3:0] bin_code;
wire [7:0] bd_code;

b2bd b(bin_code, bd_code);

initial begin
	$display("\t\t time bin_code bd_code");
	$monitor($time,,,, bin_code,,,, bd_code);
	#00 bin_code <= 4'b1010;
	#40 bin_code <= 4'b1001;
	#40 bin_code <= 4'b0011;
	#40 bin_code <= 4'b1111;
	#40 bin_code <= 4'b0000;
	#40 bin_code <= 4'b0110;
	#40 $stop;
end

endmodule
