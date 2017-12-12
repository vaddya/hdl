module elab4_1(clk, mod_in, dir, cnt_qout);
parameter MODULUS = 3;

input clk, dir;
input [7:0] mod_in;
output [7:0] cnt_qout;

reg [7:0] mod;
reg [2:0] cnt_d;
reg [3:0] cnt_q;
reg ena, load;

always @(posedge clk) begin
	if (cnt_d == MODULUS - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end

always @(posedge clk) begin
	if (ena)
		if (mod == mod_in)
			load <= 0;
		else begin
			mod <= mod_in;
			load <= 1;
		end
end

always @(posedge clk) begin
	if (ena) begin
		if (load) begin
			cnt_q <= cnt_q % mod;
		end else if (dir) begin
			cnt_q <= cnt_q + 1;
			if (cnt_q == mod - 1)
				cnt_q <= 0;
		end else begin
			cnt_q <= cnt_q - 1;
			if (cnt_q == 0)
				cnt_q <= mod - 1;
		end
	end
end

assign cnt_qout = cnt_q;

endmodule
