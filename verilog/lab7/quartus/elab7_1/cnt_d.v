module cnt_d(clk, cout);
parameter DIV = 3;

input clk;
output reg cout;

localparam N = log2(DIV);
reg [N-1:0] cnt;

always @(posedge clk) begin
	cnt <= cnt + 1;
	if (cnt == DIV - 1)
		cout <= 1'b1;
	else
		cout <= 1'b0;
end

function integer log2(input integer value);
   begin
      value = value - 1;
      for (log2 = 0; value > 0; log2 = log2 + 1)
			value = value >> 1;
	end
endfunction

endmodule
