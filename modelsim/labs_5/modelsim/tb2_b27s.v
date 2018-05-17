`timescale 1ns/1ns
module tb2_b27s;

localparam period = 40;

wire [7:0] seg;
reg [7:0] exp_seg;
reg [3:0] bin_code;
reg clk;
integer i;
b27s b(bin_code, seg);

initial begin
	clk = 1'b0;
	forever #(period / 2) clk = ~clk;
end

initial begin
	$display("\t\t time bin_code segments");
	for (i = 0; i < 16; i = i + 1) begin 
		@(posedge clk)
		bin_code = i;
		case (bin_code) 
			4'd0: exp_seg <= 8'b00111111;
			4'd1: exp_seg <= 8'b00000110;
			4'd2: exp_seg <= 8'b01011011;
			4'd3: exp_seg <= 8'b01001111;
			4'd4: exp_seg <= 8'b01100110;
			4'd5: exp_seg <= 8'b01101101;
			4'd6: exp_seg <= 8'b01111101;
			4'd7: exp_seg <= 8'b00000111;
			4'd8: exp_seg <= 8'b01111111;
			4'd9: exp_seg <= 8'b01101111;
			default: exp_seg <= 8'd0;
		endcase
		@(negedge clk)
		$display($time,,,, bin_code,,,, seg);
		if (seg !== exp_seg)
			$display("Expected %d, got %d.\n", exp_seg, seg);
	end
	$display("Testing complited");
	$stop;
end

endmodule