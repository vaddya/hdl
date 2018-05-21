`timescale 1ns / 1ns
module tb1_labs_8;

reg [3:0] a;
reg [3:0] b;
wire [3:0] max;
integer tb1_;

lab3_3 t(a, b, max);

initial begin
	$timeformat(-9, 0, "ns", 5);
	{a, b} = 0;
	#0 $fstrobe(tb1_, "\t time a b max");
	forever begin
		$fstrobe(tb1_, "\t %t %d %d %d", $time, a, b, max);
		#5 {a, b} = {a, b} + 1;
	end
end
  
initial begin
	tb1_ = $fopen("tb1_.dat", "w");
end
  
initial begin
	#1280 $fclose(tb1_);
	$stop;
end  

endmodule
