module input_muxer(clk, arst, channel, input_data, output_data);

input clk, arst;
input [3:0] channel;
input [47:0] input_data;

output reg [15:0] output_data;

always @ (posedge clk, negedge arst) begin
	if (!arst)
		output_data <= 16'h0000;
	else case (channel)
		4'h1: output_data <= input_data[15:0];
		4'h2: output_data <= input_data[31:16];
		4'h3: output_data <= input_data[47:32];
		default: output_data <= 16'h0000;
	endcase
end

endmodule
