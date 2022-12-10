library verilog;
use verilog.vl_types.all;
entity \register\ is
    generic(
        bits            : integer := 6
    );
    port(
        D               : in     vl_logic_vector;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        hlt             : in     vl_logic;
        Q               : out    vl_logic_vector
    );
end \register\;
