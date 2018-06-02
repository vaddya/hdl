module input_buffer(wrclk, rdclk, arst, wrreq, rdreq, input_data, output_data, output_ready);

input wrclk, rdclk, arst, wrreq, rdreq;
input [15:0] input_data;

output [7:0] output_data;
output reg output_ready;

wire [6:0] rdusedw;

input_fifo fifo(
	.data(input_data),
	.aclr(!arst),
	.rdclk(rdclk),
	.rdreq(rdreq),
	.wrclk(wrclk),
	.wrreq(wrreq),
	.q(output_data),
	.rdusedw(rdusedw)
);
	
always @(posedge rdclk, negedge arst) begin
	if (!arst)
		output_ready <= 1'd0;
	else
		output_ready <= rdusedw > 7'd9;
end
		
endmodule
