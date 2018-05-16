module dilab_dmux(pba, sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "54" *)
input pba;

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "46,25,24" *)
input [2:0] sw;

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "70,69,68,67,66,65" *)
output [5:0] led;

dmux dm(pba, sw, led[5:3], led[2:0]);

endmodule
