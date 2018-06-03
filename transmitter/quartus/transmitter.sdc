create_clock -name read_clk -period 10.000 [get_ports {read_clk}]
create_clock -name write_clk -period 40.000 [get_ports {write_clk[0] write_clk[1] write_clk[2]}]
create_clock -name slow_clk -period 6.666 [get_nets {lt|op|altpll_component|auto_generated|wire_pll1_clk[0]}]
create_clock -name fast_clk -period 3.333 [get_nets {lt|op|altpll_component|auto_generated|wire_pll1_clk[1]}]
derive_clock_uncertainty