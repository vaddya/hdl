`timescale 1 ns/ 1 ns
module tb2f_labs_10cd;

reg clk;
wire ena;
reg input_mem [0:23];
reg exp_mem [0:23];
integer i;

cd #(4) d(clk, ena);

initial begin
	$readmemb("input_labs_10cd.dat", input_mem);
	$readmemb("exp_labs_10cd.dat", exp_mem);
end

initial begin
	clk = 0; #10;
	for (i = 0; i < 24; i = i + 1) begin
		clk = input_mem[i];
		#10 if (ena != exp_mem[i])
			$display("Expected %d, got %d in", exp_mem[i], ena, i);
	end
end

endmodule
