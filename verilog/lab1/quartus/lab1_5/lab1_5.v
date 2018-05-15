module lab1_5(sw, led);
input [1:0] sw;
output [3:0] led;

assign led = {
	sw[1] & sw[0],
	sw[1] & ~sw[0],
	~sw[1] & sw[0],
	~sw[1] & ~sw[0]
};

endmodule
