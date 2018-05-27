	component lab2_qsys is
		port (
			clk_clk       : in  std_logic                    := 'X'; -- clk
			reset_reset_n : in  std_logic                    := 'X'; -- reset_n
			pbb_export    : in  std_logic                    := 'X'; -- export
			led_export    : out std_logic_vector(7 downto 0)         -- export
		);
	end component lab2_qsys;

	u0 : component lab2_qsys
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset_n => CONNECTED_TO_reset_reset_n, -- reset.reset_n
			pbb_export    => CONNECTED_TO_pbb_export,    --   pbb.export
			led_export    => CONNECTED_TO_led_export     --   led.export
		);

