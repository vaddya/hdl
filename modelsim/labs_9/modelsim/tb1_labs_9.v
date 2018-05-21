`timescale 1 ns/1 ns
module tb1_labs_9;

reg [1:0] a, b, c;
wire [1:0] major;
wire [1:0] flags;
integer tb1_f;

lab3_4 t(a, b, c, major, flags);

initial begin
	tb1_f = $fopen("tb1_.dat", "w");
	$fwrite(tb1_f, " time a b c major flags\n");
	{a, b, c} = 0;
	forever begin
		#5 {a, b, c} = {a, b, c} + 1;
	end
end

always @* begin
	$timeformat(-9, 0, "ns", 5);
	#0 $fwrite(tb1_f, "%t %d %d %d %d %d\n", $time, a, b, c, major, flags);
end

initial begin
	#320 $fclose(tb1_f);
	$stop;
end

endmodule
