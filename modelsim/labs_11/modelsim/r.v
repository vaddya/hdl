module r(clk, ena, aset, cnt_qout);

input clk, ena, aset;
output [3:0] cnt_qout;
reg [3:0] cnt_q;

always @(posedge clk, negedge aset) begin
	if (!aset) 
		cnt_q <= 4'b1000;			
	else if (ena)
		cnt_q <= {(cnt_q[3] ^ cnt_q[2]), cnt_q[3:1]}; 
end

assign cnt_qout = cnt_q;

endmodule
