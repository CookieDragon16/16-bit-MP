`ifndef PARAMETER_H_
`define PARAMETER_H_
// fpga4student.com 
// FPGA projects, VHDL projects, Verilog projects 
// Verilog code for RISC Processor 
// Parameter file
`define col 16 // 16 bits instruction memory, data memory
`define row_i 15 // instruction memory, instructions number, this number can be changed. Adding more instructions to verify your design is a good idea.
`define row_d 8 // The number of data in data memory. We only use 8 data. Do not change this number. You can change the value of each data inside test.data file. Total number is fixed at 8. 
`define filename "./test/test_file1.o"
`define simulation_time #160

`endif
module ERM16_microprocessor (input logic init,clk,input logic [15:0] DI,output logic [15:0] ADDR_BUS,DO,output logic wrmem,ioe,intreq);

// data_wires
logic [15:0] WD3,RD1,RD2;
logic [6:0] q_ir;
logic [8:0] q_op;

logic [15:0] imm,a,b,ALUresult;

logic [15:0] DI_PC,DO_PC;

logic [2:0] A1,A3;

logic [2:0] raf_const;

logic [15:0] w1,w2;


logic [15:0] A_ALU,B_ALU;

logic [5:0] flags_in,flags_out;


 // control signals/wires
 
logic decodeinstr,we3,rst,hlt,wrpc,prefix,jump,ch,ret,wrflags,seladdr,state_flag_bit;

 logic [5:0] Jcc;
 logic [4:0] func;
 logic [3:0] stwr;
 
 logic [1:0] spc_a;
 
 logic [2:0] spc_b;
 
 logic [15:0] w_ALUresult;
 
 // start description ERM16

register #(7) IR(DI[15:9],clk,rst,~hlt|decodeinstr,q_ir);

register #(9) AR(DI[8:0],clk,rst,~hlt|decodeinstr,q_op);


muxN #(16,5,3) mux4({DI,a,b,imm,w_ALUresult},stwr,WD3);

assign raf_const = 3'b111; 

muxN #(3) mux_A1 ({raf_const,q_op[8:6]},ret,A1);

muxN #(3) mux_A3 ({raf_const,q_op[8:6]},ch,A3);

reg_file regfile(A1,q_op[5:3],A3,we3,clk,rst,WD3,RD1,RD2);

extension ext16(q_op[5:0],imm);

register #(16*2) DR({RD1,RD2},clk,rst,~hlt,{a,b});

muxN mux_spc_a ({DO_PC,a},spc_a,A_ALU);

muxN #(16,3,2) mux_spc_b ({16'b010,imm,b},spc_b,B_ALU);

alu16 ALU(A_ALU,B_ALU,func,flags_out,flags_in,ALUresult);

latch_mem save_aluresultREG(ALUresult,rst,~wrpc,w_ALUresult);

register flags(flags_in,clk,rst,wrflags,flags_out);

muxflags mux_Jcc(flags_out,Jcc,state_flag_bit);

muxN mux_prefix({imm,a},prefix,w1);

muxN mux_jump({w1,w_ALUresult},jump,DI_PC);

register #(16) PC(DI_PC,clk,rst,wrpc,DO_PC);

muxN mux_sel_addr ({b,DO_PC},seladdr,w2);

register #(16) ARR(w2,clk,rst,~hlt,ADDR_BUS);

register #(16) MD(a,clk,rst,~hlt,DO);





control_unit cb(q_ir,clk,state_flag_bit,init,wrmem,ioe,intreq,decodeinstr,we3,rst,hlt,wrpc,prefix,jump,ch,ret,wrflags,seladdr,Jcc,func,stwr,spc_a,spc_b);

endmodule

module latch_mem (input logic [15:0] DI,input logic rst,wrpc,output logic [15:0] DO);

always_latch begin

	if (wrpc) DO = DI;
	
	else if (rst) DO = 16'h0;
	
	else DO = DO;

end

endmodule

module ERM16_tb;

	 // Inputs
	reg clk;
	reg init;
	reg [15:0] DI;
	wire [15:0] ADDR_BUS, DO;
	wire wrmem,ioe,intre;
	 // Instantiate the Unit Under Test (UUT)
	ERM16_microprocessor uut (
		.clk(clk),
		.init(init),
		.DI(DI),
		.ADDR_BUS(ADDR_BUS),
		.DO(DO),
		.wrmem(wrmem),
		.ioe(ioe),
		.intreq(intreq)
	);

	initial begin
	   clk <=0;
	   #20;
	   init <= 1;
	   #30;
	   // MOV R0, #1
	   DI=16'b0000001100011111;
	   #30;
	   //OUT R0??
	   DI=16'b0001000000000000;
	   #30;
	   // HLT??
	   DI=16'b0000110000000000;
	   #30;
	   $finish;
	end
		  
	always begin
		#5 clk = ~clk;
	end

endmodule
  

