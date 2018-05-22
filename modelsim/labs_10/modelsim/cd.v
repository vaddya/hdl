module cd(clk, ena);
parameter MODULUS = 25_000_000;

input clk;
output reg ena;
reg [25:0] cnt_d;

initial cnt_d = 0;

always @(posedge clk) begin
	if (cnt_d == MODULUS - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end

endmodule
