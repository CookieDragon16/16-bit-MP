library verilog;
use verilog.vl_types.all;
entity control_unit is
    generic(
        FLAGS_size      : integer := 6
    );
    port(
        opcode          : in     vl_logic_vector(6 downto 0);
        clk             : in     vl_logic;
        state_flag_bit  : in     vl_logic;
        init            : in     vl_logic;
        wrmem           : out    vl_logic;
        ioe             : out    vl_logic;
        intreq          : out    vl_logic;
        decodeinstr     : out    vl_logic;
        we3             : out    vl_logic;
        rst             : out    vl_logic;
        hlt             : out    vl_logic;
        wrpc            : out    vl_logic;
        prefix          : out    vl_logic;
        jump            : out    vl_logic;
        ch              : out    vl_logic;
        ret             : out    vl_logic;
        wrflags         : out    vl_logic;
        seladdr         : out    vl_logic;
        Jcc             : out    vl_logic_vector;
        func            : out    vl_logic_vector(4 downto 0);
        stwr            : out    vl_logic_vector(3 downto 0);
        spc_a           : out    vl_logic_vector(1 downto 0);
        spc_b           : out    vl_logic_vector(2 downto 0)
    );
end control_unit;
