module cnt_N(clk, rst, ena, cnt);
parameter N = 4;

input clk, rst, ena;
output reg [N-1:0] cnt;

always @(posedge clk, posedge rst) begin
	if (rst)
		cnt <= 0;
	else if (ena)
		cnt <= cnt + 1;
end

endmodule
