`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:50:20 05/24/2019 
// Design Name: 
// Module Name:    IR 
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
module Link12( // instruction register
	inst_if, inst_id, pc4_id, pc4_if, clock, resetn, LOADDEPEN
);
	input [31:0] inst_if, pc4_if;
	input clock, resetn, LOADDEPEN;
	output [31:0] inst_id, pc4_id;
	
	//将输出声明为变量
	reg [31:0] inst_id, pc4_id;
	
	always @ (posedge clock or negedge resetn) begin
		if (resetn == 0) begin
				inst_id <= 0;
				pc4_id <= 0;
		end
		else if(~LOADDEPEN) begin
				inst_id <= inst_if;
				pc4_id <= pc4_if;
		end
	end
endmodule
