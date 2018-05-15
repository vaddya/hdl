module lab7_1(sw, led);
parameter INV = 0;

(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "88, 89, 90, 91, 49, 46, 25, 24" *)
input [7:0] sw; 

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "65, 66, 67, 68, 69, 70, 71, 72" *)
output [7:0] led;

task sort;
	input [1:0] a, b;
	output [1:0] max, min;
	
	{max, min} = (a > b) ? {a, b} : {b, a};
endtask

reg [7:0] res;

always @* begin
	sort(sw[7:6], sw[5:4], res[7:6], res[3:2]);
	sort(sw[3:2], sw[1:0], res[5:4], res[1:0]);
	sort(res[5:4], res[7:6], res[7:6], res[5:4]);
	sort(res[1:0], res[3:2], res[3:2], res[1:0]);
	sort(res[3:2], res[5:4], res[5:4], res[3:2]);
end

assign led = (INV) ? ~res : res;

endmodule
