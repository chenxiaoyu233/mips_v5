`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:35 05/17/2019
// Design Name:   WB_STAGE
// Module Name:   D:/cxy/mips_v5/WB_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: WB_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module WB_tb;

	// Inputs
	reg [31:0] r_alu;
	reg [31:0] m_o;
	reg m2reg;

	// Outputs
	wire [31:0] wdi;

	// Instantiate the Unit Under Test (UUT)
	WB_STAGE uut (
		.r_alu(r_alu), 
		.m_o(m_o), 
		.m2reg(m2reg), 
		.wdi(wdi)
	);

	initial begin
		// Initialize Inputs
		r_alu = 1;
		m_o = 2;
		m2reg = 0;

		// Wait 100 ns for global reset to finish
		#50 m2reg = 0;
		#50 m2reg = 1;
        
		// Add stimulus here

	end
      
endmodule

