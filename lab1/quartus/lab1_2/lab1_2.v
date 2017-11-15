module lab1_2(sw, led, pba);
input [7:0] sw;
input pba;
output [3:0] led;

wire [3:0] pba_vec;
assign pba_vec = {4 {pba}};

assign led = (sw[3:0] & ~pba_vec) | (sw[7:4] & pba_vec);

endmodule
