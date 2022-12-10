library verilog;
use verilog.vl_types.all;
entity alu16 is
    generic(
        control_alu     : integer := 5
    );
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        func            : in     vl_logic_vector;
        flagsin         : in     vl_logic_vector(5 downto 0);
        flagsout        : out    vl_logic_vector(5 downto 0);
        y               : out    vl_logic_vector(15 downto 0)
    );
end alu16;
