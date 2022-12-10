library verilog;
use verilog.vl_types.all;
entity muxflags is
    port(
        DI              : in     vl_logic_vector(5 downto 0);
        sel             : in     vl_logic_vector(2 downto 0);
        DO              : out    vl_logic
    );
end muxflags;
