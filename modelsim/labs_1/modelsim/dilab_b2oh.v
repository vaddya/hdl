module dilab_b2oh(sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "46,25,24" *)
input [2:0] sw;
(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "72,71,70,69,68,67,66,65" *)
output [7:0] led;

b2oh #(3) dilab(sw, led);

endmodule