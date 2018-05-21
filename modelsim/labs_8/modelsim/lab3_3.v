module lab3_3(a, b, max);

input [3:0] a, b;
output [3:0] max;

reg [3:0] temp;

always @(a, b) begin
	if (a > b)
		temp = a;
	else
		temp = b;
end
	
assign max = temp;
	
endmodule
