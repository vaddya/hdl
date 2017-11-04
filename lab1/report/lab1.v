module lab1_1(sw, led, pba, pbb);
input [7:0] sw;
input pba, pbb;
output [7:0] led;

assign led[0] = pbb & sw[0] ^ ~pba;
assign led[1] = pbb & sw[1] ^ ~pba;
assign led[2] = pbb & sw[2] ^ ~pba;
assign led[3] = pbb & sw[3] ^ ~pba;
assign led[4] = pbb & sw[4] ^ ~pba;
assign led[5] = pbb & sw[5] ^ ~pba;
assign led[6] = pbb & sw[6] ^ ~pba;
assign led[7] = pbb & sw[7] ^ ~pba;

endmodule
