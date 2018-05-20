module sum(res, a, b, c_in);

parameter N = 3;

output [N:0] res;
input [N-1:0] a;
input [N-1:0] b;
input c_in;

wire [N-1:0] c;
sum_1 b_1[N-1 : 0](res[N-1 : 0], c, a, b, {c[N-2 : 0], c_in});
assign res[N] = c[N-1];
	
endmodule
