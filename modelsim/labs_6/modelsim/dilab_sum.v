`timescale 1ns/1ns
module dilab_sum(sw, pba, led);

(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "90, 91, 49, 46, 25, 24"*)
input [5:0] sw;
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64"*)
input pba;
(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "69, 70, 71, 72"*)
output [3:0] led;

sum #(3) s(led, sw[5:3], sw[2:0], pba);
	
endmodule
