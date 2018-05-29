module elab7_1(clk, pba, pbb, led);
parameter DIV = 3, INV = 0;
localparam word_num = 16, N = 4, data_W = 4, addr_W = $clog2(word_num);

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "58" *)
input pbb;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "69, 70, 71, 72" *)
output [data_W-1:0] led;

wire wre = pba;
wire rst = pbb;
wire ena;
wire [data_W-1:0] data;
wire [addr_W-1:0] addr;
wire [data_W-1:0] res;

cnt_d	#(DIV) cnt_div(.clk, .cout(ena));

cnt_N	#(data_W) cnt_data(.clk, .rst, .ena, .cnt(data));

cnt_N	#(addr_W) cnt_addr(.clk, .rst, .ena, .cnt(addr));

RAM #(word_num, data_W) mem(.clk, .wre, .data, .addr, .q(res));

assign led = (INV) ? ~res : res;

endmodule
