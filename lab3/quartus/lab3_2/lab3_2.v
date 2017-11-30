module lab3_2(number, dot_ena, ena, seg, dot);

input [3:0] number;
input dot_ena, ena;
output [6:0] seg;
output dot;

reg [6:0] temp;

always @(ena, number) begin
	if (ena)
		case (number)
			4'b0000: temp = 7'b1111110;
			4'b0001: temp = 7'b0110000;
			4'b0010: temp = 7'b1101101;
			4'b0011: temp = 7'b1111001;
			4'b0100: temp = 7'b0110011;
			4'b0101: temp = 7'b1011011;
			4'b0110: temp = 7'b1011111;
			4'b0111: temp = 7'b1110000;
			4'b1000: temp = 7'b1111111;
			4'b1001: temp = 7'b1111011;
			default: temp = 7'b0000000;
		endcase
	else 
		temp = 7'b0000000;
end

assign seg = temp;
assign dot = (ena & dot_ena);

endmodule
