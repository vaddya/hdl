module lab1_3(sw, led, pba, pbb);
input [1:0] sw;
input pba, pbb;
output [7:0] led;

assign led = {
	sw & {2{pbb}} & {2{pba}},
	sw & {2{~pbb}} & {2{pba}},
	sw & {2{pbb}} & {2{~pba}},
	sw & {2{~pbb}} & {2{~pba}}
};

endmodule
