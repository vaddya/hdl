module dilab_labs_8(sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "88,89,90,91,49,46,25,24"*)
input [7:0] sw;

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "69,70,71,72"*)
output [3:0] led;

lab3_3 t(sw[7:4], sw[3:0], led);

endmodule
