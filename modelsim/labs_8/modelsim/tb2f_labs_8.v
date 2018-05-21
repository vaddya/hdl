`timescale 1ns / 1ns
module tb2f_labs_8;

reg [3:0] a;
reg [3:0] b;
wire [3:0] max;
reg [7:0] input_mem [0:255];
reg [3:0] exp_mem [0:255];
integer i;

lab3_3 t(a, b, max);

initial begin
	$readmemb("input_labs_8.dat", input_mem);
	$readmemb("exp_labs_8.dat", exp_mem);
end
  
initial begin
	for (i = 0; i < 256; i = i + 1) begin 
		{a, b} = input_mem[i];
		#0 if (max !== exp_mem[i])
			$display("Expected %d, got %d (%d, %d)", exp_mem[i], max, a, b);
		#5;
	end
end

initial begin 
	#1280 $stop;
end

endmodule
