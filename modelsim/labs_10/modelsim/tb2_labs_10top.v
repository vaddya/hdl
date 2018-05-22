`timescale 1ns / 1ns
module tb2_labs_10top;

reg clk, ena, aset, sclr, load, dir;
reg [3:0] din;
wire [3:0] cnt_qout;
reg [3:0] cnt_exp = 3'b0000;
integer j;

lab4_1 t(clk, aset, sclr, load, dir, din, cnt_qout);

initial begin
	j = 0;
	clk = 0;
	ena = 0;
	forever #(5) clk = ~clk;
end

always @(posedge clk) begin
	if (j == 2) begin 
		#1 ena = 1;
		j = 0;
	end else begin
		#1 ena = 0;
		j = j + 1;
	end
end

initial begin
	{aset,sclr,load,dir} = 4'b0000;
    #50 din = 0; {aset,sclr,load,dir} = 4'b1101;
    #300 {aset,sclr,load,dir} = 4'b1100;
    #300 aset = 0;
    #50 {aset,sclr,load,dir} = 4'b1001;
    #50 din = 5; {aset,sclr,load,dir} = 4'b1110;
    #50 {aset,sclr,load,dir} = 4'b1101;
end
  
always @(posedge clk, negedge aset) begin
	if (!aset) 
		cnt_exp <= 4'b1000;			
	else if (ena) 
		if (!sclr)
			cnt_exp <= 4'b0;
		else if (load) 
			cnt_exp <= din;		
		else if (dir)
			cnt_exp <= cnt_exp - 1'b1;
		else 
			cnt_exp <= cnt_exp - 1'b1;
end

always @(negedge ena) begin
	if (cnt_qout !== cnt_exp)
		$display ("Expected %d, got %d", cnt_exp, cnt_qout);
end

initial begin
	#1000 $stop;
end

endmodule
