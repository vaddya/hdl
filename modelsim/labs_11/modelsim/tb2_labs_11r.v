`timescale 1ns/1ns
module tb2_labs_11r;

reg clk, ena, aset;
wire [3:0] cnt_qout;
reg [3:0] exp_cnt;

r re(clk, ena, aset, cnt_qout);

initial 
    begin
	clk = 0;
	repeat(30) #5 clk = ~clk;
	#50 $display("Test ended succesfuly");
    end

initial begin
	aset = 0; ena = 0;
	@(posedge clk);
	exp_cnt = 4'b1000;
	aset = 1; ena = 1;
	repeat(20) begin
		@(posedge clk);
		exp_cnt <=  {(exp_cnt[3] ^ exp_cnt[2]), exp_cnt[3:1]}; 
		@(negedge clk);
		if (cnt_qout != exp_cnt)
			$display("Expected %d, got %d", exp_cnt, cnt_qout);
	end
end

endmodule
