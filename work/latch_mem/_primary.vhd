library verilog;
use verilog.vl_types.all;
entity latch_mem is
    port(
        DI              : in     vl_logic_vector(15 downto 0);
        rst             : in     vl_logic;
        wrpc            : in     vl_logic;
        DO              : out    vl_logic_vector(15 downto 0)
    );
end latch_mem;
