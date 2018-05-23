`timescale 1ns /1ns
module tb1_labs_14;

reg  [7:0] data;
wire [7:0] sorted;
integer tb1_, i;

lab7_1 #(0) t(data, sorted);

initial begin 
    tb1_ = $fopen("tb1_.dat");
	$fwrite(tb1_, "\t time (data) (sorted)\n");
    $timeformat(-9, 0, " ns", 7);
    $fmonitor(tb1_, "%t (%d %d %d %d) (%d %d %d %d)", $time, 
		data[7:6], data[5:4], data[3:2], data[1:0],
		sorted[7:6], sorted[5:4], sorted[3:2], sorted[1:0]);
end

initial begin
	for (i = 0; i < 2**8; i = i + 1) begin
		#10 data = i; 
	end
	$fclose(tb1_);
	$stop;
end

endmodule
