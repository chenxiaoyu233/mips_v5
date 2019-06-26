`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:42:41 05/17/2019
// Design Name:   ID_STAGE
// Module Name:   D:/cxy/mips_v5/ID_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ID_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ID_tb;

	// Inputs
	reg [31:0] pc4;
	reg [31:0] inst;
	reg [31:0] wdi;
	reg clk;
	reg clrn;
	reg rsrtequ;

	// Outputs
	wire [31:0] bpc;
	wire [31:0] jpc;
	wire [1:0] pcsource;
	wire m2reg;
	wire wmem;
	wire [2:0] aluc;
	wire aluimm;
	wire [31:0] a;
	wire [31:0] b;
	wire [31:0] imm;
	wire shift;

	// Instantiate the Unit Under Test (UUT)
	ID_STAGE uut (
		.pc4(pc4), 
		.inst(inst), 
		.wdi(wdi), 
		.clk(clk), 
		.clrn(clrn), 
		.bpc(bpc), 
		.jpc(jpc), 
		.pcsource(pcsource), 
		.m2reg(m2reg), 
		.wmem(wmem), 
		.aluc(aluc), 
		.aluimm(aluimm), 
		.a(a), 
		.b(b), 
		.imm(imm), 
		.shift(shift), 
		.rsrtequ(rsrtequ)
	);

	initial begin
		// Initialize Inputs
		pc4 = 0;
		inst = 0;
		wdi = 0;
		clk = 0;
		clrn = 0;
		rsrtequ = 0;

		// Wait 100 ns for global reset to finish
		#50 clk = 1; #50 clk = 0;
		clrn = 1; #50 clk = 1; #50 clk = 0;
		inst = 32'b000000_000001_00000_00000_00000_00001;
		#50 clk = 1; #50 clk = 0;
		inst = 32'b000000_000001_00000_00000_00000_00010;
		#50 clk = 1; #50 clk = 0;
		inst = 32'b000000_000001_00000_00000_00000_00011;
		#50 clk = 1; #50 clk = 0;
		inst = 32'b000000_000001_00000_00000_00000_00100;
		#50 clk = 1; #50 clk = 0;
		
		// Add stimulus here

	end
      
endmodule

