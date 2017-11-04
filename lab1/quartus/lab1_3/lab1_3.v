// Demultiplexer
module lab1_3(sw, led, pba, pbb);
input [1:0] sw;
input pba, pbb;
output [7:0] led;

assign led[1:0] = sw & {2{~pbb}} & {2{~pba}};
assign led[3:2] = sw & {2{pbb}} & {2{~pba}};
assign led[5:4] = sw & {2{~pbb}} & {2{pba}};
assign led[7:6] = sw & {2{pbb}} & {2{pba}};

endmodule
