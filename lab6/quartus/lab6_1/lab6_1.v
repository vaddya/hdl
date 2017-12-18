module mux2_1(res, a, b, ctrl);

input a, b, ctrl;
output res;

wire a_and, b_and;

and(a_and, a, ~ctrl);
and(b_and, b, ctrl);
or(res, a_and, b_and);

endmodule

module lab6_1(res, ina, inb, ctrl);

(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "49, 46, 25, 24" *)
input [3:0] ina;

(* altera_attribute = "-name IO_STANDARD \"3.3-v LVCMOS\"", chip_pin = "88, 89, 90, 91" *)
input [3:0] inb;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input ctrl; 

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "69, 70, 71, 72" *)
output [3:0] res;

wire [3:0] out;

mux2_1(out[3], ina[3], inb[3], ctrl);
mux2_1(out[2], ina[2], inb[2], ctrl);
mux2_1(out[1], ina[1], inb[1], ctrl);
mux2_1(out[0], ina[0], inb[0], ctrl);

assign res = out;

endmodule

