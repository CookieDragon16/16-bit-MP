library verilog;
use verilog.vl_types.all;
entity reg_file is
    generic(
        bits            : integer := 16;
        N               : integer := 3
    );
    port(
        RA1             : in     vl_logic_vector;
        RA2             : in     vl_logic_vector;
        WA3             : in     vl_logic_vector;
        WE3             : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        WD3             : in     vl_logic_vector;
        RD1             : out    vl_logic_vector;
        RD2             : out    vl_logic_vector
    );
end reg_file;
