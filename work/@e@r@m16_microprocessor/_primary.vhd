library verilog;
use verilog.vl_types.all;
entity ERM16_microprocessor is
    port(
        init            : in     vl_logic;
        clk             : in     vl_logic;
        DI              : in     vl_logic_vector(15 downto 0);
        ADDR_BUS        : out    vl_logic_vector(15 downto 0);
        DO              : out    vl_logic_vector(15 downto 0);
        wrmem           : out    vl_logic;
        ioe             : out    vl_logic;
        intreq          : out    vl_logic
    );
end ERM16_microprocessor;
