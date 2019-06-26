`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:29:54 05/24/2019 
// Design Name: 
// Module Name:    Link45 
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
module Link45(
	Alu_Result_mem, mo_mem, m2reg_mem, wn_mem, wreg_mem,
	Alu_Result_wb, mo_wb, m2reg_wb, wn_wb, wreg_wb,
	Clock, Resetn
);
	input [31:0] Alu_Result_mem, mo_mem;
	input m2reg_mem, Clock, Resetn, wreg_mem;
	input [4:0] wn_mem;
	output [31:0] Alu_Result_wb, mo_wb;
	output m2reg_wb, wreg_wb;
	output [4:0] wn_wb;
	
	reg [31:0] Alu_Result_wb, mo_wb;
	reg m2reg_wb, wreg_wb;
	reg [4:0] wn_wb;
	
	always @ (posedge Clock or negedge Resetn) begin
		if (Resetn == 0) begin
			Alu_Result_wb <= 0;
			mo_wb <= 0;
			m2reg_wb <= 0;
			wn_wb <= 0;
			wreg_wb <= 0;
		end
		else begin
			Alu_Result_wb <= Alu_Result_mem;
			mo_wb <= mo_mem;
			m2reg_wb <= m2reg_mem;
			wn_wb <= wn_mem;
			wreg_wb <= wreg_mem;
		end
	end

endmodule
