module control_unit(clk, arst, input_ready, output_ready, read_req, sel);

localparam N = 4, LENGTH = 4'd9;

input clk, arst;
input input_ready;

output reg output_ready;
output read_req;
output reg [1:0] sel;

reg [N-1:0] counter;

assign read_req = counter > 1'd0;

initial begin
	counter <= 2'b0;
	sel <= 2'b0;
	output_ready <= 1'b0;
end

always @ (posedge clk, negedge arst) begin
	if (!arst)
		output_ready <= 1'b0;
	else if (counter == LENGTH)
		output_ready <= 1'b0;
	else
		output_ready <= input_ready;
end

always @ (posedge clk, negedge arst) begin	
	if (!arst) 
		counter <= 2'd0;
	else if (input_ready == 1 && sel == 2'b00)
		counter <= counter + 2'd1;
	else if (counter == LENGTH)
		counter <= 2'd0;
	else if (counter > 2'd0)
		counter <= counter + 2'd1;
end

always @ (posedge clk, negedge arst) begin
	if (!arst) 
		sel <= 2'b00;
	else case (sel)
		2'b00: sel <= 2'b01;
		2'b01: sel <= read_req ? 2'b10 : 2'b00;
		2'b10: sel <= read_req ? 2'b10 : 2'b00;
	endcase
end

endmodule
