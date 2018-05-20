module dilab_mux(pba, sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "54" *)
input pba;
(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "88,89,90,46,25,24" *)
input [5:0] sw;
(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "67,66,65" *)
output [2:0] led;

mux #(3) m(pba, sw[5:3], sw[2:0], led[2:0]);

endmodule
