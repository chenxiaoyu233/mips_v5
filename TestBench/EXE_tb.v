`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:58 05/17/2019
// Design Name:   EXE_STAGE
// Module Name:   D:/cxy/mips_v5/EXE_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: EXE_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module EXE_tb;

	// Inputs
	reg [2:0] ealuc;
	reg ealuimm;
	reg [31:0] ea;
	reg [31:0] eb;
	reg [31:0] eimm;
	reg eshift;

	// Outputs
	wire [31:0] ealu;
	wire z;

	// Instantiate the Unit Under Test (UUT)
	EXE_STAGE uut (
		.ealuc(ealuc), 
		.ealuimm(ealuimm), 
		.ea(ea), 
		.eb(eb), 
		.eimm(eimm), 
		.eshift(eshift), 
		.ealu(ealu), 
		.z(z)
	);
/*
module EXE_STAGE(ealuc,ealuimm,ea,eb,eimm,eshift,ealu,z
    );
	 input [31:0] ea,eb,eimm;		//ea-由寄存器读出的操作数a；eb-由寄存器读出的操作数a；eimm-经过扩展的立即数；
	 input [2:0] ealuc;		//ALU控制码
	 input ealuimm,eshift;		//ALU输入操作数的多路选择器
	 output [31:0] ealu;		//alu操作输出
	 output z;
	 
	 wire [31:0] alua,alub,sa;

	 assign sa={26'b0,eimm[9:5]};//移位位数的生成

	 mux32_2_1 alu_ina (ea,sa,eshift,alua);//选择ALU a端的数据来源
	 mux32_2_1 alu_inb (eb,eimm,ealuimm,alub);//选择ALU b端的数据来源
 	 alu al_unit (alua,alub,ealuc,ealu,z);//ALU
	 
endmodule
*/
	initial begin
		// Initialize Inputs
		ealuc = 0;
		ealuimm = 0;
		ea = 0;
		eb = 0;
		eimm = 0;
		eshift = 0;

		// Wait 100 ns for global reset to finish
		ea = 1; eb = 2; 
		#50 ealuc = 0;
		#50 ealuc = 1;
		#50 ealuc = 2;
		#50 ealuc = 3;
		#50 ealuc = 4;
		#50 ealuc = 5;
		#50 ealuc = 6;
		// Add stimulus here

	end
      
endmodule

