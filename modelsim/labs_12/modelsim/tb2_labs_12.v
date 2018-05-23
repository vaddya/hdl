`timescale 1ns/1ns
module tb2_labs_12();

reg aclr, clk;
reg  [1:0] data;
wire [2:0] result;
reg [2:0] exp_res;
reg in2, in1;

integer i;
lab5_2 #(.N(1)) t(clk, aclr, data, result);

initial begin
    clk = 0;
    repeat (100) #5 clk = ~clk;
end
	
initial begin
    aclr = 0; 
	#30 aclr = 1; data = 0; 
	#100 data = 1; 
	#100 data = 2; 
	#100 data = 3; 
	#100 data = 4; 
	#100 data = 5; 
	#100 $stop;
end

always @(posedge clk, negedge aclr) begin
	{in2, in1} = data;
	if (~aclr) 
		exp_res <= 0;
	else
		case (exp_res) 
			0 : if (in2) exp_res <= 2;
				  else exp_res <= (in1) ? 7 : 1;
			1 : exp_res <= (in1) ? 0 : 2;
			2 : if (in2) exp_res <= 4;
				  else exp_res <= (in1) ? 1 : 3;
			3 : exp_res <= (in1) ? 2 : 4;
			4 : if (in2) exp_res <= 6;
				  else exp_res <= (in1) ? 3 : 5;
			5 : exp_res <= (in1) ? 4 : 6;
			6 : if (in2) exp_res <= 0;
				  else exp_res <= (in1) ? 5 : 7;
			7 : exp_res <= (in1) ? 6 : 0;
		endcase
	if (result != exp_res)
		$display("Expected %d, got %d", exp_res, result);
end

endmodule
