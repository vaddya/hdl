module lab_ismce(clk, pba, pbb, led);

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "58" *)
input pbb;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "65, 66, 67, 68, 69, 70, 71, 72" *)
output [7:0] led;

wire rst = pba;
wire ena = pbb;
reg [5:0] addr;

rom rom(.address(addr), .clock(clk), .q(led));

always @(posedge clk, negedge rst) begin
	if (~rst) 
		addr <= 0;
	else if (ena) 
		addr <= addr + 1;
	else
		addr <= addr; 
end

endmodule
