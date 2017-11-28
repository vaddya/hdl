module lab3_1(x, res, x_state);

input [4:0] x;
output res, x_state;

reg[1:0] out;

always @(x) begin
	case (x)
		5'b00000, 
		5'b00001,
		5'b00010,
		5'b00101,
		5'b01000,
		5'b01001,
		5'b01011,
		5'b01100,
		5'b01101,
		5'b01110,
		5'b10011,
		5'b10100,
		5'b10101,
		5'b11000,
		5'b11010,
		5'b11101,
		5'b11110: out = 2'b10;
		5'b00110,
		5'b10000,
		5'b10111,
		5'b11100: out = 2'b01;
		default: out = 2'b00;
	endcase
end

assign {res, x_state} = out;

endmodule
