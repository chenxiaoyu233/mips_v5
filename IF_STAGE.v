`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:26 05/14/2019 
// Design Name: 
// Module Name:    IF_STAGE 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module IF_STAGE(
    clk,clrn,pcsource,bpc,jpc,pc4,inst, PC, LOADDEPEN
);
	 input clk, clrn;
	 input [31:0] bpc,jpc;
	 input [1:0] pcsource;
     input LOADDEPEN;
	 
	 output [31:0] pc4,inst;
	 output [31:0] PC;
	 
	 wire [31:0] pc;
	 wire [31:0] npc;
	 
 	 dff32 program_counter(npc,clk,clrn,pc, LOADDEPEN);   
	 add32 pc_plus4(pc,32'h4,pc4);
	 mux32_4_1 next_pc(pc4,bpc,jpc,32'b0,pcsource,npc);
	 Inst_ROM inst_mem(pc,inst);
	 
	 assign PC=pc;
	 
endmodule
