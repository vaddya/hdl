module lab4_2(clk, aset, cnt_qout);
parameter MODULUS = 25_000_000;

input clk, aset;
output [3:0] cnt_qout;
reg [25:0] cnt_d;
reg [3:0] cnt_q;
reg ena;

always @(posedge clk) begin
	if (cnt_d == MODULUS - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end

always @(posedge clk, negedge aset) begin
	if (!aset) 
		cnt_q <= 4'b1000;			
	else if (ena) 
			cnt_q <= {(cnt_q[3] ^ cnt_q[2]), cnt_q[3:1]}; 
end

assign cnt_qout = cnt_q;

endmodule
