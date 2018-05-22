module cb(clk, ena, aset, sclr, load, dir, din, cnt_qout);

input clk, ena, aset, sclr, load, dir;
input [3:0] din;
output [3:0] cnt_qout;

reg [3:0] cnt_q;

always @(posedge clk, negedge aset) begin
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
end

assign cnt_qout = cnt_q;

endmodule
