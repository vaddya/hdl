module commutator(clk, arst, input_ready, input_data, read_req, output_data);

input clk, arst;
input [2:0] input_ready;
input [47:0] input_data;

output [2:0] read_req;
output [7:0] output_data;

wire read_req_flag, output_ready;
wire [3:0] channel_num;
wire [1:0] sel;
wire [2:0] input_ready_mem;
wire [7:0] data, header, length;

assign read_req = input_ready_mem & {3 {read_req_flag}};
assign length = channel_num == 4'hF ? 8'd0 : 8'd9;

assign M = channel_num == 4'hF ? 8'd0 : 8'd9;
assign header = {4'hF, channel_num};

channel_encoder cd(
	.clk(clk),
	.arst(arst),
	.ena(!output_ready),
	.pos(input_ready),
	.bin(channel_num),
	.one_bit(input_ready_mem)
);

input_muxer im(
	.clk(clk),
	.arst(arst),
	.channel(channel_num),
	.input_data(input_data),
	.output_data(data)
);
           
control_unit cu(
	.clk(clk),
	.arst(arst),
	.input_ready(|input_ready_mem),
	.output_ready(output_ready),
	.read_req(read_req_flag),
	.sel(sel)
);

output_muxer om(
	.clk(clk),
	.arst(arst),
	.sel(sel),
	.header(header),
	.length(length),
	.data(data),
	.output_data(output_data)
);

endmodule
