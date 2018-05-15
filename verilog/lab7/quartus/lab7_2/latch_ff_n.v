module latch_ff_n
#(parameter N=4)

(	input [N-1:0] da, db, dc,
	input [1:0]	sel,
	input clk,
	input load,
	output [N-1:0] q_out );
	
	reg [N-1:0] rg_int;
	reg [N-1:0] temp;
	
always @*
	if	(sel == 2'b00) temp = da;
	else if (sel == 2'b01) temp = dc;
	else if (sel == 2'b10) temp = db;
	
always @(posedge clk, posedge load)
	if (load)
		rg_int <= temp;
	else
		rg_int <= {rg_int[N-2:1], rg_int[N-1]};
		
assign q_out = rg_int;

endmodule
