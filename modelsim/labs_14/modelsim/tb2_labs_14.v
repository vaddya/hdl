`timescale 1ns/1ns
module tb2_labs_14;

reg [7:0] data;
wire [7:0] sorted;
reg [1:0] a, b, c, d;
integer i;

lab7_1 #(0) t(data, sorted);

initial begin
	for (i = 0; i < 2**8; i = i + 1) begin
		data = i;
		#5 {a, b, c, d} = sorted;
		if (a < b || b < c || c < d)
			$display("Unsorted (%d %d %d %d) for (%d %d %d %d)", 
				a, b, c, d, data[7:6], data[5:4], data[3:2], data[1:0]);
	end
	$stop;
end

endmodule
