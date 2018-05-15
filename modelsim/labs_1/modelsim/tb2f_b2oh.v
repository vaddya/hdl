`timescale 1ns/1ns
module tb2f_b2oh;

localparam period = 40;
localparam N = 2;

reg [N - 1:0] binary_code;
wire [2 ** N - 1:0] pos_code;
reg  [2 ** N - 1:0] right_pos_code;
reg clk;
integer i;
reg [N - 1:0] input_mem [0:2 ** N];
reg [2 ** N - 1:0] right_mem [0:2 ** N];

b2oh #(N) xxx(binary_code, pos_code);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$readmemb("input_b2oh.dat", input_mem );
	$readmemb("exp_b2oh.dat", right_mem );
end

initial begin
	$display("\t\t time bin_code pos_code");
	for (i = 0; i < 4; i = i + 1)
	    begin
		@(posedge clk);
		binary_code = input_mem[i];
		right_pos_code = right_mem[i];
		@(negedge clk);		
		$display($time,,,,binary_code,,,,pos_code);
		if (pos_code !== right_pos_code)
		     $display("Error: expected %b, got %b.\n", right_pos_code, pos_code);
	    end
	$display("Testing complited");
	$stop;
end

endmodule
	
