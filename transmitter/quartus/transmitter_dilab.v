module transmitter_dilab(clk, pba, pbb, sw, led);

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "58" *)
input pbb;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "88, 89, 90, 91, 49, 46, 25, 24" *)
input [7:0] sw;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "71, 72" *)
output [1:0] led;

wire write_clk;
wire read_clk;
wire arst;
wire [2:0] write_req;
wire [47:0] input_data;
wire [1:0] output_data;

assign input_data = {sw + 8'd1, sw + 8'd1, sw, sw, sw - 8'd1, sw - 8'd1};
assign write_req = (pbb ? 3'b100 : 3'b001);
assign arst = pba;
assign led[1:0] = output_data;

dilab_pll pll(
	.inclk0(clk),
	.c0(write_clk),
	.c1(read_clk)
);

transmitter t(
	.write_clk({3 {write_clk}}),
	.read_clk(read_clk),
	.arst(arst),
	.write_req(write_req),
	.input_data(input_data),
	.output_data(output_data)
);

endmodule
