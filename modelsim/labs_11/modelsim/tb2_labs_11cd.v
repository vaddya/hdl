`timescale 1 ns/ 1 ns
module tb2_labs_11cd;

reg clk;
wire cout;
integer i;

cd #(3) d(clk, cout);

initial begin
	clk = 0;
	i = 0;
	repeat(60) #10 clk = ~clk;
end

always@(posedge clk) begin
	#5 if (cout) begin
		if (i != 2)
			$display("Expected 2, got %d", i);
		else
			i = 0;
	end else begin
		i = i + 1;
	end
end

endmodule