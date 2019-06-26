`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:09:47 05/24/2019 
// Design Name: 
// Module Name:    Link23 
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
module Link23(
	aluc_id, aluimm_id, ra_id, rb_id, imm_id, shift_id, m2reg_id, wmem_id, wn_id, wreg_id, ADEPEN_id, BDEPEN_id, STOREDEPEN_id,
	aluc_exe, aluimm_exe, ra_exe, rb_exe, imm_exe, shift_exe, m2reg_exe, wmem_exe, wn_exe, wreg_exe, ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe,
	Clock, Resetn
);
	input Clock, Resetn;
	input [2:0] aluc_id;
	input aluimm_id, shift_id, m2reg_id, wmem_id, wreg_id;
	input [4:0] wn_id;
	input [31:0] ra_id, rb_id, imm_id;
    input [1:0] ADEPEN_id, BDEPEN_id, STOREDEPEN_id;
	output [2:0] aluc_exe;
	output aluimm_exe, shift_exe, m2reg_exe, wmem_exe, wreg_exe;
	output [4:0] wn_exe;
	output [31:0] ra_exe, rb_exe, imm_exe;
    output [1:0] ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe;
	
	reg [2:0] aluc_exe;
	reg aluimm_exe, shift_exe, m2reg_exe, wmem_exe, wreg_exe;
	reg [4:0] wn_exe;
	reg [31:0] ra_exe, rb_exe, imm_exe;
    reg [1:0] ADEPEN_exe, BDEPEN_exe, STOREDEPEN_exe;
	
	always @ (posedge Clock or negedge Resetn) begin
		if (Resetn == 0) begin
			aluc_exe <= 0;
			aluimm_exe <= 0;
			ra_exe <= 0;
			rb_exe <= 0;
			imm_exe <= 0;
			shift_exe <= 0;
			m2reg_exe <= 0;
			wmem_exe <= 0;
			wn_exe <= 0;
			wreg_exe <= 0;
            ADEPEN_exe <= 0;
            BDEPEN_exe <= 0;
            STOREDEPEN_exe <= 0;
		end
		else begin
			aluc_exe <= aluc_id;
			aluimm_exe <= aluimm_id;
			ra_exe <= ra_id;
			rb_exe <= rb_id;
			imm_exe <= imm_id;
			shift_exe <= shift_id;
			m2reg_exe <= m2reg_id;
			wmem_exe <= wmem_id;
			wn_exe <= wn_id;
			wreg_exe <= wreg_id;
            ADEPEN_exe <= ADEPEN_id;
            BDEPEN_exe <= BDEPEN_id;
            STOREDEPEN_exe <= STOREDEPEN_id;
		end
	end

endmodule
