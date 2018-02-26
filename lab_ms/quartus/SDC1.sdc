create_clock -name clk_in -period 10.000 [get_ports {clk_in}]
derive_pll_clocks -create_base_clocks
derive_clock_uncertainty
set_false_path -from [get_ports {data_in}]
set_false_path -to [get_ports {out_fail}]