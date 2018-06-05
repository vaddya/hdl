module transmitter(write_clk, read_clk, arst, write_req, input_data, output_data);

input read_clk;
input arst;
input [2:0] write_clk, write_req;
input [47:0] input_data;

output [1:0] output_data;

wire [2:0] input_ready, read_req;
wire [7:0] comm_output_data;
wire [23:0] buffer_output_data;
wire data_clk;

input_buffer b1(
	.read_clk(read_clk),
	.arst(arst),
	.write_clk(write_clk[0]),
	.read_req(read_req[0]),
	.write_req(write_req[0]),
	.input_data(input_data[15:0]),
	.output_data(buffer_output_data[7:0]),
	.input_ready(input_ready[0])
);

input_buffer b2(
	.read_clk(read_clk),
	.arst(arst),
	.write_clk(write_clk[1]),
	.read_req(read_req[1]),
	.write_req(write_req[1]),
	.input_data(input_data[31:16]),
	.output_data(buffer_output_data[15:8]),
	.input_ready(input_ready[1])
);

input_buffer b3(
	.read_clk(read_clk),
	.arst(arst),
	.write_clk(write_clk[2]),
	.read_req(read_req[2]),
	.write_req(write_req[2]),
	.input_data(input_data[47:32]),
	.output_data(buffer_output_data[23:16]),
	.input_ready(input_ready[2])
);

commutator c(
	.clk(data_clk),
	.arst(arst),
	.input_ready(input_ready),
	.input_data(buffer_output_data),
	.read_req(read_req),
	.output_data(comm_output_data)
);

lvds_transmitter lt(
	.arst(arst),
	.input_clk(read_clk),
	.input_data(comm_output_data),
	.data_clk(data_clk),
	.output_data(output_data)
);

endmodule
