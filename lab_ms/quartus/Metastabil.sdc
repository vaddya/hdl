create_clock -name clk_in -period 10.000 [get_ports {clk_in}]
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty
set_false_path -from [get_ports {data_in}]

#set_false_path -to [get_ports {out_fail}]
#create_clock -name vir_clk_out -period 40.000

#set_output_delay -clock { vir_clk_out } 10 [get_ports {out_fail}]
#set_output_delay -clock { vir_clk_out } -min 7.777 [get_ports {out_fail}]
#set_output_delay -clock { vir_clk_out } -max 5.555 [get_ports {out_fail}]

set_false_path -to [get_ports {out_fail}]
