module elab1_3(sw, led, pba);
input [3:0] sw;
input pba;
output [2:0] led;

wire sum1, sum2;
wire c1, c2;

counter counter1(sw[0], sw[2], ~pba, sum1, c1);
counter counter2(sw[1], sw[3], c1, sum2, c2);

assign led = {c2, sum2, sum1};

endmodule

module counter(a, b, c_in, sum, c_out);
input a, b, c_in;
output sum, c_out;

wire s_sum = a ^ b;

assign sum = c_in ^ s_sum;
assign c_out = (a & b) | (s_sum & c_in);

endmodule
