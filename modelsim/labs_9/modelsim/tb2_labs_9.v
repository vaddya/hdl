`timescale 1 ns/1 ns
module tb2_labs_9;

reg [1:0] a, b, c;
wire [1:0] major, flags;
reg [1:0] major_exp, flags_exp;

lab3_4 t(a, b, c, major, flags);

always @(a, b, c) begin
	if (a == b) begin
		if (b == c) begin
			major_exp = a;
			flags_exp = 2'b00;
		end else begin
			major_exp = a;
			flags_exp = 2'b10;
		end
	end else if (a == c) begin
		major_exp = a;
		flags_exp = 2'b10;	
	end else if (b == c) begin
		major_exp = b;
		flags_exp = 2'b10;	
	end else begin
		major_exp = 2'b11;
		flags_exp = 2'b00;
	end
end

initial begin
	{a, b, c} = 0;
	forever begin
		#5 {a, b, c} = {a, b, c} + 1;
	end
end
  
initial forever begin
	#1 if (major !== major_exp || flags !== flags_exp) begin
		$timeformat(-9, 0, "ns", 5);
		#5 $display("Expected (%d,%d), got (%d,%d) for %d %d %d.", major_exp, flags_exp, major, flags, a, b, c);
	end
end

initial begin
	#320 $stop;
end

endmodule
