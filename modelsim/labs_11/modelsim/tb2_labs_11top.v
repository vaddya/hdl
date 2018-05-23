`timescale 1ns/1ns
module tb2_labs_11top;

reg clk, aset;
wire [3:0] cnt_qout;
reg [3:0] exp_cnt;

lab4_2 t(clk, aset, cnt_qout);

initial begin
	clk = 0;
	repeat(200) #5 clk = ~clk;
end

initial begin
	aset = 0;
	@(posedge clk);
	exp_cnt = 4'b1000;
	aset = 1;
	repeat (20) begin
	    repeat(2) @(posedge clk);
	    @(posedge clk);
	    exp_cnt <=  {(exp_cnt[3] ^ exp_cnt[2]), exp_cnt[3:1]}; 
	    @(negedge clk);
		if (cnt_qout != exp_cnt)
			$display("Expected %d, got %d", exp_cnt, cnt_qout);
	end
end

endmodule
