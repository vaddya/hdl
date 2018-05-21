module dilab_labs_9(sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "90,91,49,46,25,24"*)
reg [5:0] sw;

(* altera_attribute = "-name IO_STANDARD \"2.5-V\"", chip_pin = "69,70,71,72"*)
wire [3:0] led;

lab3_4 t(sw[5:4], sw[3:2], sw[1:0], led[1:0], led[3:2]);

endmodule
