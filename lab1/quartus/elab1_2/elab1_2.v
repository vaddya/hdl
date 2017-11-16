module elab1_2(sw, pba, led);
input [1:0] sw;
input pba;
output [1:0] led;

assign led = {
	~pba & sw[1] | ~pba & sw[0] | sw[1] & sw[0],
	~led[1] & (~pba | sw[1] | sw[0]) | (~pba & sw[1] & sw[0])
};

endmodule
