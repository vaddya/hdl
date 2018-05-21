`timescale 1 ns/1 ns
module tb2f_labs_9;

reg [1:0] a, b, c;
wire [1:0] major, flags;
reg [5:0] input_mem [0:63];
reg [3:0] exp_mem [0:63];
integer i;

lab3_4 t(a, b, c, major, flags);

initial begin
	$readmemb("input_labs_9.dat", input_mem);
	$readmemb("exp_labs_9.dat", exp_mem);
end

initial begin
	for (i = 0; i < 64; i = i + 1) begin 
		{a, b, c} = input_mem[i];
		#0 if ({flags, major} !== exp_mem[i])
			$display("%d: Expected (%d,%d), got (%d,%d) for %d %d %d.", i, exp_mem[i][1:0], exp_mem[i][3:2], major, flags, a, b, c);
		#5;
	end
end

initial begin
	#320 $stop;
end

endmodule
