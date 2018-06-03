module input_buffer(read_clk, write_clk, arst, read_req, write_req, input_data, output_data, input_ready);

input read_clk, write_clk, arst, read_req, write_req;
input [15:0] input_data;

output [7:0] output_data;
output reg input_ready;

wire [6:0] read_used_w;

input_fifo fifo(
	.data(input_data),
	.aclr(!arst),
	.rdclk(read_clk),
	.rdreq(read_req),
	.wrclk(write_clk),
	.wrreq(write_req),
	.q(output_data),
	.rdusedw(read_used_w)
);
	
always @(posedge read_clk, negedge arst) begin
	if (!arst)
		input_ready <= 1'd0;
	else
		input_ready <= read_used_w > 7'd9;
end
		
endmodule
