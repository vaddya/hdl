`timescale 1ns/1ns
module tb2_b2oh;

localparam period = 40;
localparam N = 2;

reg [N - 1:0] binary_code;
wire [2 ** N - 1:0] pos_code;
reg  [2 ** N - 1:0] right_pos_code;
reg clk;
integer i;

b2oh #(N) xxx(binary_code, pos_code);

initial begin
	clk = 1'b0;
	forever #(period / 40) clk = ~clk;
end

initial begin
	binary_code = 2'b0;
	right_pos_code = 4'b0001;
end

initial begin
	$display("\t\t time bin_code pos_code");
	for (i = 0; i < 4; i = i + 1)
	    begin
		@(posedge clk);
		$display($time,,,,binary_code,,,,pos_code);
		if (pos_code !== right_pos_code)
		     $display("Error: expected %b, got %b.\n", right_pos_code, pos_code);
		@(negedge clk);
		binary_code = binary_code + 1;
		right_pos_code = right_pos_code << 1;
	    end
	$display("Testing complited");
	$stop;
end

endmodule
	