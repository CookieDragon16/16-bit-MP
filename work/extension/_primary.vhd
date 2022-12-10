library verilog;
use verilog.vl_types.all;
entity extension is
    generic(
        inp_bits        : integer := 6
    );
    port(
        DI              : in     vl_logic_vector;
        DO              : out    vl_logic_vector
    );
end extension;
