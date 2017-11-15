module lab1_4(sw, led);
input [3:0] sw;
output [1:0] led;

assign led = {
	sw[3] | sw[2],
	sw[3] | sw[1]
};

endmodule
