`timescale 1ns/1ns
module tb1_mux;

localparam N = 3;
reg  [N - 1:0] a, b;
wire [N - 1:0] result;
reg sel;

mux #(N) m(sel, a, b, result);

initial begin
	#000 a   <= 3'b001;
		 b   <= 3'b111;
		 sel <= 1'b0;
	#080 sel <= 1'b1;
	#080 a   <= 3'b111;
		 b   <= 3'b100;
		 sel <= 1'b0;
	#080 sel <= 1'b1;
end

initial begin
	$display("\t\t time sel a b result");
	$monitor($time,,,,, sel,,,,, a,,,,, b,,,, result);
	#320 $stop;
end

endmodule
