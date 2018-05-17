module b27s(bin_code, seg);

input [3:0] bin_code;
output reg [7:0] seg;

always @* begin
	seg <= 8'd0;
	case (bin_code)
		4'd0: seg <= 8'b00111111;
		4'd1: seg <= 8'b00000110;
		4'd2: seg <= 8'b01011011;
		4'd3: seg <= 8'b01001111;
		4'd4: seg <= 8'b01100110;
		4'd5: seg <= 8'b01101101;
		4'd6: seg <= 8'b01111101;
		4'd7: seg <= 8'b00000111;
		4'd8: seg <= 8'b01111111;
		4'd9: seg <= 8'b01101111;
		default: seg <= 8'd0;
	endcase
end

endmodule
