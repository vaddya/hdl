module lab4_1(clk, aset, sclr, load, dir, din, cnt_qout);
parameter MODULUS = 25_000_000;

input clk, aset, sclr, load, dir;
input [3:0] din;
output [3:0] cnt_qout;

logic [25:0] cnt_d;
logic [3:0] cnt_q;
logic ena;

always @(posedge clk) begin : divider
	if (cnt_d == MODULUS - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end : divider

always @(posedge clk, negedge aset) begin : counter
	if (!aset) 
		cnt_q <= 4'b1000;			
	else if (ena) 
		if (!sclr) 
			cnt_q <= 4'b0;
		else if (load) 
			cnt_q <= din;		
		else if (dir)
			cnt_q <= cnt_q + 1'b1;
		else 
			cnt_q <= cnt_q - 1'b1;
end : counter

assign cnt_qout = cnt_q;

endmodule
