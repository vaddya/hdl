module sum_1(res, c_out, a, b, c_in);

output res, c_out;
input a, b, c_in;
wire c1, c2, c3;

xor xor_1(res, a, b, c_in);
and and_1(c1, a, b);
and and_2(c2, a, c_in);
and and_3(c3, b, c_in);
or or_1(c_out, c1, c2, c3);

endmodule
