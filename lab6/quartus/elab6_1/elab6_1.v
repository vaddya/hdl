module elab6_1(clk, sw, led);
parameter N = 8, INV = 0;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;

(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "88, 89, 90, 91, 49, 46, 25, 24" *)
input [2*N-1:0] sw;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "65, 66, 67, 68, 69, 70, 71, 72" *)
output [2*N-1:0] led;

reg [N-1:0] a;
reg [N-1:0] b;
reg load;
reg [N-1:0] sa;
reg [N-1:0] sb;
reg [2*N-1:0] res;
reg [N-1:0] cnt;
		
always @(posedge clk) begin
	load <= sw[N-1:0] != a || sw[2*N-1:N] != b;
	a <= sw[N-1:0];
	b <= sw[2*N-1:N];
	if (load) begin
		sa <= sw[N-1:0];
		sb <= sw[2*N-1:N];
		res <= 1'b0;
		cnt <= 1'b0;
	end else begin
		repeat (N) begin
			res <= (cnt < N) ? ((res << 1) + sb[N-1] * sa) : res;
			sb <= sb <<< 1;
			cnt <= (cnt < N) ? cnt + 1'b1 : cnt;
		end
	end
end

assign led = (INV) ? ~res : res;		

endmodule
