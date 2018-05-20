`timescale 1 ns/1 ns
module tb2f_sums();
reg signed [2:0] a;
reg signed [2:0] b;
reg c;
wire c_out;
wire signed [2:0] res;
integer i;
reg [6:0] input_mem [0:127];
reg signed [3:0] exptd_mem [0:127];


sum ch(.led({c_out, res}), .sw({a, b}), .key(c));

initial 
  begin
   $readmemb("input_sums.dat", input_mem);
   $readmemb("exp_sums.dat", exptd_mem);
  end

initial 
  begin
   for (i=0; i <= 127; i = i+1) 
    begin 
      {a, b, c} = input_mem[i];
      #0;
      if ({c_out, res} !== exptd_mem[i])
        begin
          $display ("FAIL");
          $display ("expected %b, but got %b%b, a = %b, b = %b, c = %b", exptd_mem[i], c_out, res, a, b, c);
          $stop; 
        end 
      #5;
    end
  end


initial #640 $display("\n**TEST PASSED SUCCESSFULLY**\n");
initial #640 $stop;
endmodule
