module output_muxer(clk, arst, sel, header, length, data, output_data);

input clk, arst;
input [1:0] sel;
input [7:0] header, length, data;

output reg [7:0] output_data;

always @ (posedge clk, negedge arst) begin
	if (!arst)
		output_data <= 8'h00;
	else case (sel)
		2'b00: output_data <= header;
		2'b01: output_data <= length;
		2'b10: output_data <= data;
		default: output_data <= 8'h00;
	endcase
end


endmodule
