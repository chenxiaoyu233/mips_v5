`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:43:18 05/17/2019
// Design Name:   MEM_STAGE
// Module Name:   D:/cxy/mips_v5/MEM_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MEM_STAGE
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MEM_tb;

	// Inputs
	reg we;
	reg [31:0] addr;
	reg [31:0] datain;
	reg clk;

	// Outputs
	wire [31:0] dataout;

	// Instantiate the Unit Under Test (UUT)
	MEM_STAGE uut (
		.we(we), 
		.addr(addr), 
		.datain(datain), 
		.clk(clk), 
		.dataout(dataout)
	);

	initial begin
		// Initialize Inputs
		we = 0;
		addr = 0;
		datain = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		we = 1; addr = 0; datain = 15; #50 clk = 1; #50 clk = 0;
      we = 0; addr = 0;  #50 clk = 1; #50 clk = 0;
      we = 0; addr = 4;  #50 clk = 1; #50 clk = 0;
		we = 0; addr = 8;  #50 clk = 1; #50 clk = 0;
		we = 0; addr = 12;  #50 clk = 1; #50 clk = 0;
		we = 0; addr = 16;  #50 clk = 1; #50 clk = 0;
		// Add stimulus here

	end
      
endmodule

