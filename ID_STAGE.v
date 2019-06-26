`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:48 05/15/2019 
// Design Name: 
// Module Name:    ID_STAGE 
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
module ID_STAGE(pc4,inst,
    wdi,clk,clrn,bpc,jpc,pcsource,
    m2reg,wmem,aluc,aluimm,a,b,imm,
    shift,rsrtequ, wn_id, wn_wb, wreg_id, wreg_wb,
    wn_exe, wn_mem, ADEPEN, BDEPEN,
    m2reg_exe, LOADDEPEN, STOREDEPEN, wreg_exe, wreg_mem
);
	 input [31:0] pc4,inst,wdi;                                 // pc4-PCֵ���ڼ���jpc��inst-��ȡ��ָ�wdi-��Ĵ���д�������
	 input clk,clrn;                                            // clk-ʱ���źţ�clrn-��λ�źţ�
	 input rsrtequ;                                             // branch�����ź�
	 input [4:0] wn_wb;                                         // wb��Ŀ�ļĴ�����
     input [4:0] wn_exe, wn_mem;                                // exe, mem��Ŀ�ļĴ�����
	 input wreg_wb;                                             // wb���Ĵ���дʹ��
     input m2reg_exe;
     input wreg_exe, wreg_mem;
	 output [31:0] bpc,jpc,a,b,imm;                             // bpc-branch_pc��jpc-jump_pc��a-�Ĵ���������a��b-�Ĵ���������b��imm-������������
	 output [2:0] aluc;                                         // ALU�����ź�
	 output [1:0] pcsource;                                     // ��һ��ָ���ַѡ��
	 output m2reg,wmem,aluimm,shift;
	 output [4:0] wn_id;                                        // id��Ŀ�ļĴ�����
	 output wreg_id;                                            // id���Ĵ���дʹ��
     output [1:0] ADEPEN, BDEPEN, STOREDEPEN;
     output LOADDEPEN;

	 wire wreg;
	 wire [4:0] rn;                                             // д�ؼĴ�����
	 wire [5:0] op,func;
	 wire [4:0] rs,rt,rd;
	 wire [31:0] qa,qb,br_offset;
	 wire [15:0] ext16;
	 wire regrt,sext,e;

	 assign func=inst[25:20];
	 assign op=inst[31:26];
	 assign rs=inst[9:5];
	 assign rt=inst[4:0];
	 assign rd=inst[14:10];
     Control_Unit cu(
         rsrtequ,func,                              // ���Ʋ���
         op,wreg_id,m2reg,wmem,aluc,regrt,aluimm,
         sext,pcsource,shift, rs, rt, rd, wn_exe, wn_mem, ADEPEN, BDEPEN,
         m2reg_exe, LOADDEPEN, STOREDEPEN, wreg_exe, wreg_mem, clk
     );

     Regfile rf (rs,rt,wdi,wn_wb,wreg_wb,~clk,clrn,qa,qb);      // �Ĵ����ѣ���32��32λ�ļĴ�����0�żĴ�����Ϊ0
	 mux5_2_1 des_reg_num (rd,rt,regrt,wn_id);                  // ѡ��Ŀ�ļĴ�����������rd,����rt

	 assign a=qa;
	 assign b=qb;

	 assign e=sext&inst[25];                                    // ������չ��0��չ
	 assign ext16={16{e}};                                      // ������չ
	 assign imm={ext16,inst[25:10]};                            // �����������з�����չ

	 assign br_offset={imm[29:0],2'b00};                        // ����ƫ�Ƶ�ַ
	 add32 br_addr (pc4,br_offset,bpc);                         // beq,bneָ���Ŀ���ַ�ļ���
	 assign jpc={pc4[31:28],inst[25:0],2'b00};                  // jumpָ���Ŀ���ַ�ļ���

endmodule
