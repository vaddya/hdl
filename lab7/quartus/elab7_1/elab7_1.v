module elab7_1(clk, pba, pbb, led);
parameter DIV = 3, INV = 0, data_W = 4, word_num = 16, N = 4;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "23" *)
input clk;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "64" *)
input pba;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "58" *)
input pbb;

(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "69, 70, 71, 72" *)
output [data_W-1:0] led;

localparam adr_W = log2(word_num);
wire wre = pba;
wire rst = pbb;
wire ena;
wire [data_W-1:0] data;
wire [adr_W-1:0] adr;
wire [data_W-1:0] res;

cnt_d	#(DIV) cnt_div(clk, ena);

cnt_N	#(data_W) cnt_data(clk, rst, ena, data);

cnt_N	#(adr_W) cnt_adr(clk, rst, ena, adr);

RAM 	#(word_num, data_W) mem(clk, wre, data, adr, res);

assign led = (INV) ? ~res : res;

function integer log2(input integer value);
   begin
      value = value - 1;
      for (log2 = 0; value > 0; log2 = log2 + 1)
			value = value >> 1;
	end
endfunction

endmodule
