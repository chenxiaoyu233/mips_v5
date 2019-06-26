`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:13 05/15/2019 
// Design Name: 
// Module Name:    EXE_STAGE 
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
module EXE_STAGE(
    ealuc,ealuimm,ea,eb,eimm,eshift,ealu,z, ADEPEN, BDEPEN, STOREDEPEN, result_mem, result_wb, stob
);
	 input [31:0] ea,eb,eimm;		
     input [31:0] result_mem, result_wb;
	 input [2:0] ealuc;		
	 input ealuimm,eshift;		
     input [1:0] ADEPEN, BDEPEN, STOREDEPEN;
     output [31:0] stob;
	 output [31:0] ealu;		
	 output z;
	 
	 wire [31:0] alua, alub, sa;

	 assign sa={26'b0,eimm[9:5]};

	 mux32_4_1 alu_ina (ea,sa, result_mem, result_wb, ADEPEN,alua);
	 mux32_4_1 alu_inb (eb,eimm, result_mem, result_wb, BDEPEN,alub);
	 mux32_4_1 alu_stob (eb,eimm, result_mem, result_wb, STOREDEPEN,stob);
 	 alu al_unit (alua,alub,ealuc,ealu,z);
	 
endmodule
