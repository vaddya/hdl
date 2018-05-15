module elab5_2(clk, pba, sw, led);
parameter N = 25_000_000;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;
(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "25, 24" *)
input [1:0] sw; 
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "70, 71, 72" *)
output [2:0] led;

reg [N-1:0] cnt_d;
reg [2:0] state;

assign rst = pba;
assign in1 = sw[0];
assign in2 = sw[1];
reg ena;

always @(posedge clk) begin
	if (cnt_d == N - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end

always @(posedge clk, negedge rst) begin
	if (~rst) 
		state <= 3'b0;
	else if (ena)
		if (in2)
			state = state + 2;
		else if (in1)
			state = state - 1;
		else
			state = state + 1;
end

assign led = state;

endmodule
