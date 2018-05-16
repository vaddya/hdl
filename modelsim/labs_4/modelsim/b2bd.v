module b2bd(bin_code, bd_code);

input [3:0] bin_code;
output reg [7:0] bd_code;

always @* begin
	if (bin_code > 4'd9) begin
		bd_code [7:4] <= 4'd1;
		bd_code [3:0] <= bin_code - 4'd10;
	end else begin
		bd_code [7:4] <= 4'd0;
		bd_code [3:0] <= bin_code;
	end
end

endmodule
