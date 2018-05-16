`timescale 1ns/1ns
module tb1_b2oh;

reg [2:0] binary;
wire [7:0] positional;
b2oh #(3) bin2pos(binary, positional);

initial begin
	#000 binary <= 3'b000;
	#100 binary <= 3'b001;
	#100 binary <= 3'b010;
	#100 binary <= 3'b011;
	#100 binary <= 3'b100;
	#100 binary <= 3'b101;
	#100 binary <= 3'b110;
	#100 binary <= 3'b111;
end

initial begin
	$display("\t\t time binary positinal");
	$monitor($time,,,,binary,,,,positional);
	#800 $stop;
end

endmodule
