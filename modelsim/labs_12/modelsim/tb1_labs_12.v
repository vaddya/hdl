`timescale 1ns/1ns
module tb1_labs_12;

reg aclr, clk;
reg  [1:0] data;
wire [2:0] result;
integer tb1_;

lab5_2 #(.N(2)) t(clk, aclr, data, result);

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

initial begin 
    tb1_ = $fopen("tb1_.dat");
	$fwirte(tb1_, "\t time aclr data res\n");
    $timeformat(-9, 0, " ns", 7);
    $fmonitor(tb1_, "%t %b %d %d", $time, aclr, data, result);
end

endmodule
