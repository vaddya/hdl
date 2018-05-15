module b2oh(binary_code, oh_code);
parameter N = 8;

input [N-1:0] binary_code;
output reg [2**N-1:0] oh_code;

initial oh_code <= {2**N{1'b0}};

always @* begin
	oh_code <= {2**N{1'b0}};
	oh_code[binary_code] <= 1'b1;
end

endmodule
