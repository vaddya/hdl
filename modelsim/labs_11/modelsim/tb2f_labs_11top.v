`timescale 1ns/ 1ns
module tb2f_labs_11top;

reg clk, aset;
wire [3:0] cnt_qout;
reg input_mem [0:8];
reg [3:0] exp_mem [0:8];
integer i;

lab4_2 t(clk, aset, cnt_qout);

initial begin
	$readmemb("input_labs_11top.dat", input_mem);
	$readmemb("exp_labs_11top.dat", exp_mem);
end

initial begin
	clk = 0;
	forever #(20) clk = ~clk;
end

initial
    begin
	for(i = 0; i < 9; i = i + 1) begin
	    aset = input_mem[i];
	    repeat(3) @(posedge clk);
	    @(negedge clk);
		if (cnt_qout != exp_mem[i])
			$display("Expected %d, got %d", exp_mem[i], cnt_qout);
	end
    $stop;
end

endmodule
