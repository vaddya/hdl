module cnt_d(clk, cout);
parameter DIV = 3;
localparam N = $clog2(DIV);

input clk;
output logic cout;

logic [N-1:0] cnt;

always_ff @(posedge clk) begin
	cnt <= cnt + 1;
	if (cnt == DIV - 1)
		cout <= 1'b1;
	else
		cout <= 1'b0;
end

endmodule
