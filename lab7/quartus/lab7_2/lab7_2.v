module lab7_2(da, db, dc, sel, clk, load, q_out);
parameter N = 4;

input [N-1:0] da, db, dc;
input [1:0] sel;
input clk, load;
output [N-1:0] q_out;

reg [N-1:0] rg_int;
reg [N-1:0] temp;

always @* begin
	case (sel)
		2'b00: temp = da;
		2'b01: temp = dc;
		2'b10: temp = db;
		default: temp = 0;
	endcase

end
	
always @(posedge clk, posedge load)
	if (load)
		rg_int <= temp;
	else
		rg_int <= {rg_int[N-2:0], rg_int[N-1]};

assign q_out = rg_int;

endmodule
