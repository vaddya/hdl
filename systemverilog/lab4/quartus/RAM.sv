module RAM(clk, wre, data, addr, q);
parameter word_num = 16, data_W = 4;
localparam addr_W = $clog2(word_num);

input clk, wre;
input [data_W-1:0] data;
input [addr_W-1:0] addr;
output reg [data_W-1:0] q;

logic [data_W-1:0] mem [0:word_num-1];
logic [addr_W-1:0] addr_reg;

initial begin
	for (int i = 0; i < word_num; i = i + 1)
		mem[i] = (i % 2) ? {data_W {1'b1}} : {data_W {1'b0}};
end

always_ff @(posedge clk) begin
	if (wre) mem[addr] <= data;
	addr_reg <= addr;
end

always @* q = mem[addr_reg];

endmodule
