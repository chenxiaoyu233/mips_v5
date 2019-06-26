`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:59 05/14/2019 
// Design Name: 
// Module Name:    PPCPU 
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
module PPCPU(
	Clock, Resetn, PC,
	inst_if, inst_id, 
	Alu_Result_exe, Alu_Result_mem, Alu_Result_wb
);
	 input Clock, Resetn;
	 output [31:0] PC, inst_if, inst_id, Alu_Result_exe, Alu_Result_mem, Alu_Result_wb;
	 
	 wire [1:0] pcsource;
	 wire [31:0] bpc, jpc, pc4; 
	 
	 wire [31:0] wdi, ra, rb, imm;
	 wire m2reg, wmem, aluimm, shift, z;
	 wire [2:0] aluc;
	 
	 wire [31:0] mo;

	 wire [31:0] inst_if, inst_id, pc4_id, pc4_if;
	 
	 wire [2:0] aluc_id;
	 wire aluimm_id, shift_id, m2reg_id, wmem_id, wreg_id;	
	 wire [4:0] wn_id;
	 wire [31:0] ra_id, rb_id, imm_id;
	 
	 wire [2:0] aluc_exe;
	 wire aluimm_exe, shift_exe, m2reg_exe, wmem_exe, wreg_exe;
	 wire [4:0] wn_exe;
	 wire [31:0] ra_exe, rb_exe, imm_exe;

	 wire [31:0] Alu_Result_exe;
	 wire z_exe;
	 wire [31:0] Alu_Result_mem, rb_mem;
	 wire z_mem, m2reg_mem, wmem_mem, wreg_mem;
	 wire [4:0] wn_mem;

	 wire [31:0] mo_mem;
	 wire [31:0] Alu_Result_wb, mo_wb;
	 wire m2reg_wb, wreg_wb;
	 wire [4:0] wn_wb;

     wire [1:0] ADEPEN_id, BDEPEN_id, STOREDEPEN_id;
     wire [1:0] ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe;
     wire LOADDEPEN;
     wire [31:0] stob_exe;

	 IF_STAGE stage1 (Clock, Resetn, pcsource, bpc, jpc, pc4_if, inst_if, PC, LOADDEPEN);
	 
	 Link12 link12(inst_if, inst_id, pc4_id, pc4_if, Clock, Resetn, LOADDEPEN);
	 
     ID_STAGE stage2 (
         pc4_id, inst_id, wdi, Clock, Resetn, bpc, jpc, pcsource,
         m2reg_id, wmem_id, aluc_id, aluimm_id, ra_id, rb_id, imm_id, shift_id, z_mem,
         wn_id, wn_wb, wreg_id, wreg_wb, wn_exe, wn_mem, ADEPEN_id, BDEPEN_id,
         m2reg_exe, LOADDEPEN, STOREDEPEN_id, wreg_exe, wreg_mem
     );

	 Link23 link23(
		aluc_id, aluimm_id, ra_id, rb_id, imm_id, shift_id, m2reg_id, wmem_id, wn_id, wreg_id, ADEPEN_id, BDEPEN_id, STOREDEPEN_id,
		aluc_exe, aluimm_exe, ra_exe, rb_exe, imm_exe, shift_exe, m2reg_exe, wmem_exe, wn_exe, wreg_exe, ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe,
		Clock, Resetn
	 );

	 EXE_STAGE stage3 (
         aluc_exe, aluimm_exe, ra_exe, rb_exe, imm_exe, shift_exe, Alu_Result_exe, z_exe, 
         ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe, Alu_Result_mem, Alu_Result_wb, stob_exe
     );
	 
	 Link34 link34(
		Alu_Result_exe, z_exe, m2reg_exe, wmem_exe, stob_exe, wn_exe, wreg_exe,
		Alu_Result_mem, z_mem, m2reg_mem, wmem_mem, rb_mem, wn_mem, wreg_mem,
		Clock, Resetn
	 );
	 
	 MEM_STAGE stage4 (wmem_mem, Alu_Result_mem, rb_mem, Clock, mo_mem);
	 
	 Link45 link45(
		Alu_Result_mem, mo_mem, m2reg_mem, wn_mem, wreg_mem,
		Alu_Result_wb, mo_wb, m2reg_wb, wn_wb, wreg_wb,
		Clock, Resetn
	 );
	 
	 WB_STAGE stage5 (Alu_Result_wb, mo_wb, m2reg_wb, wdi);


endmodule
