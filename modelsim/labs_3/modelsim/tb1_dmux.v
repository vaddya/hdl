`timescale 1ns/1ns
module tb1_dmux;

localparam N = 3;

wire [N - 1:0] res1, res2;
reg  [N - 1:0] data;
reg sel;
dmux #(3) dm(data, sel, res1, res2);

initial begin
	#000 data <= 4'b010;
		 sel  <= 1'b0;
	#040 sel  <= 1'b1;
	#040 data <= 4'b101;
		 sel  <= 1'b0;
	#040 sel  <= 1'b1;
	#040 data <= 4'b111;
		 sel  <= 1'b0;
	#040 sel  <= 1'b1;
end

initial begin
	$display("\t\t time data sel res1 res2");
	$monitor($time,,,, data,,,,,, sel,,,, res1,,,,, res2);
	#240 $stop;
end

endmodule