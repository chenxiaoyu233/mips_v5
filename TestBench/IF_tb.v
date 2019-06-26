`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:24 05/17/2019
// Design Name:   IF_STAGE
// Module Name:   D:/cxy/mips_v5/IF_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IF_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IF_tb;

	// Inputs
	reg clk;
	reg clrn;
	reg [1:0] pcsource;
	reg [31:0] bpc;
	reg [31:0] jpc;

	// Outputs
	wire [31:0] pc4;
	wire [31:0] inst;
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	IF_STAGE uut (
		.clk(clk), 
		.clrn(clrn), 
		.pcsource(pcsource), 
		.bpc(bpc), 
		.jpc(jpc), 
		.pc4(pc4), 
		.inst(inst), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clrn = 0;
		pcsource = 0;
		bpc = 1;
		jpc = 3;

		// Wait 100 ns for global reset to finish
		clrn = 0; #50 clk = 1; #50 clk = 0;
		clrn = 1; #50 clk = 1; #50 clk = 0;
		pcsource = 0; #50 clk = 1; #50 clk = 0;
		pcsource = 1; #50 clk = 1; #50 clk = 0;
		pcsource = 2; #50 clk = 1; #50 clk = 0;
		pcsource = 3; #50 clk = 1; #50 clk = 0;
		// Add stimulus here
		
	end
      
endmodule

