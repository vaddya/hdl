module lab1_1(sw, led, pba, pbb);
input [7:0] sw;
input pba, pbb;
output [7:0] led;

assign led = {
	(sw[0] ^ ~pba) & pbb,
	(sw[1] ^ ~pba) & pbb,
	(sw[2] ^ ~pba) & pbb,
	(sw[3] ^ ~pba) & pbb,
	(sw[4] ^ ~pba) & pbb,
	(sw[5] ^ ~pba) & pbb,
	(sw[6] ^ ~pba) & pbb,
	(sw[7] ^ ~pba) & pbb
};

endmodule
