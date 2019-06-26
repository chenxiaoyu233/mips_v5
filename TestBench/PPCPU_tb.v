`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:20:36 05/24/2019
// Design Name:   PPCPU
// Module Name:   C:/Users/Lenovo/Desktop/exp2/mips_v5/PPCPU_tb.v
// Project Name:  mips_v5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PPCPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PPCPU_tb;

	// Inputs
	reg Clock;
	reg Resetn;

	// Outputs
	wire [31:0] PC;
	wire [31:0] inst_if;
	wire [31:0] inst_id;
	wire [31:0] Alu_Result_exe;
	wire [31:0] Alu_Result_mem;
	wire [31:0] Alu_Result_wb;

	// Instantiate the Unit Under Test (UUT)
	PPCPU uut (
		.Clock(Clock), 
		.Resetn(Resetn), 
		.PC(PC), 
		.inst_if(inst_if), 
		.inst_id(inst_id), 
		.Alu_Result_exe(Alu_Result_exe), 
		.Alu_Result_mem(Alu_Result_mem), 
		.Alu_Result_wb(Alu_Result_wb)
	);

	initial begin
        $dumpfile("main.vcd");
        $dumpvars(0, uut);
		// Initialize Inputs
		Clock = 0;
		Resetn = 0;

		// Wait 100 ns for global reset to finish
		#100 Resetn = 1;
        
		// Add stimulus here
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
        #50 Clock <= ~Clock;
    end
	
	//always #50 Clock = ~Clock;
      
endmodule

