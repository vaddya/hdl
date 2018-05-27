
module lab2_qsys (
	clk_clk,
	reset_reset_n,
	pbb_export,
	led_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		pbb_export;
	output	[7:0]	led_export;
endmodule
