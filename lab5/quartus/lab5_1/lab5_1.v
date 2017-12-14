module lab5_1(sw, led);
parameter N = 4, LOGIC_TYPE = 2, IN_A_NOT = 0, IN_B_NOT = 1, OUT_NOT = 1;

(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "88, 89, 90, 91, 49, 46, 25, 24" *)
input [7:0] sw; 
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "65, 66, 67, 68" *)
output [3:0] led;

wire [N-1:0] a;
wire [N-1:0] b;
reg [7:4] res;

assign a = (IN_A_NOT) ? ~sw[7:4] : sw[7:4];
assign b = (IN_B_NOT) ? ~sw[3:0] : sw[3:0];

always @* begin
	case (LOGIC_TYPE)
		1'b00 : res <= a & b;
		1'b01 : res <= a | b;
		default : res <= a ^ b;
	endcase
end

assign led = (OUT_NOT)? ~res : res;

endmodule
