library verilog;
use verilog.vl_types.all;
entity muxN is
    generic(
        bits            : integer := 16;
        size            : integer := 2;
        set             : integer := 1
    );
    port(
        DI              : in     vl_logic_vector;
        sel             : in     vl_logic_vector;
        DO              : out    vl_logic_vector
    );
end muxN;
