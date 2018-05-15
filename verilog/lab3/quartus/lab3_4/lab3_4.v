module lab3_4(a, b, c, major, flags);

input [1:0] a, b, c;
output [1:0] major, flags;

reg [1:0] major_temp, flags_temp;

always @(a, b, c) begin
	if (a == b) begin
		if (b == c) begin
			major_temp = a;
			flags_temp = 2'b11;
		end else begin
			major_temp = a;
			flags_temp = 2'b10;
		end
	end else if (a == c) begin
		major_temp = a;
		flags_temp = 2'b10;	
	end else if (b == c) begin
		major_temp = b;
		flags_temp = 2'b10;	
	end else begin
		major_temp = 2'b00;
		flags_temp = 2'b00;
	end
end

assign major = major_temp;
assign flags = flags_temp;

endmodule
