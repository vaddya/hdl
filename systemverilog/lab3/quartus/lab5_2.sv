module lab5_2(clk, pba, sw, led);
parameter N = 3;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;
(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "25, 24" *)
input [1:0] sw; 
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "70, 71, 72" *)
output [2:0] led;

logic [N-1:0] cnt_d;

typedef enum { S0, S1, S2, S3, S4, S5, S6, S7 } states;
states state;

assign rst = pba;
assign in1 = sw[0];
assign in2 = sw[1];
reg ena;

always @(posedge clk) begin : divider
	if (cnt_d == N - 1) begin
		ena <= 1;
		cnt_d <= 0;
	end else begin
		ena <= 0;
		cnt_d <= cnt_d + 1;
	end
end : divider

always @(posedge clk, negedge rst) begin : state_machine
	if (~rst) 
		state <= S0;
	else
		if (ena)
			case (state)
				S0 : if (in2) state <= S2;
					  else state <= (in1) ? S7 : S1;
				S1 : state <= (in1) ? S0 : S2;
				S2 : if (in2) state <= S4;
					  else state <= (in1) ? S1 : S3;
				S3 : state <= (in1) ? S2 : S4;
				S4 : if (in2) state <= S6;
					  else state <= (in1) ? S3 : S5;
				S5 : state <= (in1) ? S4 : S6;
				S6 : if (in2) state <= S0;
					  else state <= (in1) ? S5 : S7;
				S7 : state <= (in1) ? S6 : S0;
			endcase
end : state_machine

assign led = state;

endmodule
