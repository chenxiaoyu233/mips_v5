`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:22:18 05/24/2019 
// Design Name: 
// Module Name:    Link34 
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
module Link34(
		Alu_Result_exe, z_exe, m2reg_exe, wmem_exe, rb_exe, wn_exe, wreg_exe,
		Alu_Result_mem, z_mem, m2reg_mem, wmem_mem, rb_mem, wn_mem, wreg_mem,
		Clock, Resetn
);

	input [31:0] Alu_Result_exe, rb_exe;
	input Clock, Resetn, z_exe, m2reg_exe, wmem_exe, wreg_exe;
	input [4:0] wn_exe;
	output [31:0] Alu_Result_mem, rb_mem;
	output z_mem, m2reg_mem, wmem_mem, wreg_mem;
	output [4:0] wn_mem;
	
	reg [31:0] Alu_Result_mem, rb_mem;
	reg z_mem, m2reg_mem, wmem_mem, wreg_mem;
	reg [4:0] wn_mem;

	always @ (posedge Clock or negedge Resetn) begin
		if (Resetn == 0) begin
			Alu_Result_mem <= 0;
			z_mem <= 0;
			m2reg_mem <= 0;
			wmem_mem <= 0;
			rb_mem <= 0;
			wn_mem <= 0;
			wreg_mem <= 0;
		end
		else begin
			Alu_Result_mem <= Alu_Result_exe;
			z_mem <= z_exe;
			m2reg_mem <= m2reg_exe;
			wmem_mem <= wmem_exe;
			rb_mem <= rb_exe;
			wn_mem <= wn_exe;
			wreg_mem <= wreg_exe;
		end
	end

endmodule
