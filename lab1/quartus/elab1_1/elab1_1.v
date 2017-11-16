module elab1_1(sw, led);
input [1:0] sw;
output [1:0] led;

assign led = {
	sw[0] & sw[1],
	sw[0] ^ sw[1]
};

endmodule
