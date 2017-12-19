module RAM(clk, wre, data, addr, q);
parameter word_num = 16, data_W = 4;
localparam adr_W = log2(word_num);

input clk, wre;
input [data_W-1:0] data;
input [adr_W-1:0] addr;
output reg [data_W-1:0] q;

reg [data_W-1:0] mem [0:word_num-1];
reg [adr_W-1:0] addr_reg;

initial begin
	integer i;
	for (i = 0; i < word_num; i = i + 1)
		mem[i] = (i % 2) ? {data_W {1'b1}} : {data_W {1'b0}};
end

always @(posedge clk) begin
	if (wre) mem[addr] <= data;
	addr_reg <= addr;
end

always @* q = mem[addr_reg];

function integer log2(input integer value);
   begin
      value = value - 1;
      for (log2 = 0; value > 0; log2 = log2 + 1)
			value = value >> 1;
	end
endfunction

endmodule
