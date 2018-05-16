`timescale 1ns/1ns
module tb2_dmux;

localparam period = 80;
localparam N = 3;
reg [N - 1:0] data, expected, result;
reg sel, clk;
wire [N - 1:0] out1, out2;
dmux #(N) dm(data, sel, out1, out2);
integer i, j;

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$display("\t\t time data sel out1 out2");
	for (i = 0; i < 2 ** N; i = i + 1) begin
 	    for (j = 0; j < 2; j = j + 1) begin
			@(posedge clk);
			$display($time,,,, data,,, sel,,,, out1,,,, out2);
			expected = data;
			result = out1 ? out1 : out2;
			if (result !== expected)
				$display("Expected %d, got %d.\n", expected, result);
			@(negedge clk);
			data = i;
			sel = j;
	    end
	end
	$display("Testing complited");
	$stop;
end

endmodule

