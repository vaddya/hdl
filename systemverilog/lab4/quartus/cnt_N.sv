module cnt_N(clk, rst, ena, cnt);
parameter N = 4;

input clk, rst, ena;
output logic [N-1:0] cnt;

always_ff @(posedge clk, posedge rst) begin
	if (rst)
		cnt <= 0;
	else if (ena)
		cnt <= cnt + 1;
end

endmodule
