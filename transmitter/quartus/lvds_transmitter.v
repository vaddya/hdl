module lvds_transmitter(arst, input_clk, input_data, data_clk, output_data);

input arst;
input input_clk;
input [7:0] input_data;

output data_clk;
output [1:0] output_data;

wire slow_clk, fast_clk;

output_pll op(
	.areset(!arst),
	.inclk0(input_clk),
	.c0(data_clk), // c0 = 100 MHz
	.c1(slow_clk), // c1 = 150 MHz
	.c2(fast_clk) // c2 = 300 MHz
);
	
output_lvds ol(
	.tx_in(input_data),
	.tx_inclock(fast_clk),
	.tx_syncclock(slow_clk),
	.tx_out(output_data)
);

endmodule
