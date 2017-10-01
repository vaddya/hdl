library verilog;
use verilog.vl_types.all;
entity lab3 is
    port(
        cout            : out    vl_logic;
        clk             : in     vl_logic;
        load            : in     vl_logic;
        d               : in     vl_logic_vector(3 downto 0);
        q               : out    vl_logic_vector(3 downto 0)
    );
end lab3;
