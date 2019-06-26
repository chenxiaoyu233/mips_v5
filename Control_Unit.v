`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:46:15 05/15/2019 
// Design Name: 
// Module Name:    Control_Unit 
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
module Control_Unit(rsrtequ,func,
    op,wreg,m2reg,wmem,aluc,regrt,aluimm,
    sext,pcsource,shift, rs, rt, rd, rd_exe, rd_mem, ADEPEN, BDEPEN, 
    m2reg_exe, LOADDEPEN, STOREDEPEN, wreg_exe, wreg_mem, Clock
);
    input rsrtequ;                                    // �ж�ALU�������Ƿ�Ϊ0��if(r=0)rsrtequ=1��
    input [5:0] func,op;                              // ָ������Ӧ�������ֶ�
    input [4:0] rs, rt, rd, rd_exe, rd_mem;
    input m2reg_exe;
    input wreg_exe, wreg_mem;
    input Clock;
    output wreg,m2reg,wmem,regrt,aluimm,sext,shift;
    output [2:0] aluc;                                // ALU������
    output [1:0] pcsource;                            // PC��·ѡ����������
    output [1:0] ADEPEN, BDEPEN, STOREDEPEN;          // ����ǰ��ѡ���ź�
    output LOADDEPEN;                                 // ��ˮ����ͣ�ź�

    reg [2:0] aluc;
    reg [1:0] pcsource;
    reg [1:0] ADEPEN, BDEPEN, STOREDEPEN;                      
    reg LOADDEPEN;                                 
    reg CancelInst;

    wire i_add,i_and,i_or,i_xor,i_sll,i_srl,i_sra;    // �Ĵ��������־
    wire i_addi,i_andi,i_ori,i_xori;                  // �����������־
    wire i_lw,i_sw;                                   // �洢�������־
    wire i_beq,i_bne;                                 // branch�����־
    wire i_j;                                         // jump�����־

    ////////////////////////////////////////////�����־������/////////////////////////////////////////////////////////
    and(i_add,~op[5],~op[4],~op[3],~op[2],~op[1],~op[0],~func[2],~func[1],func[0]); // add�����־
    and(i_and,~op[5],~op[4],~op[3],~op[2],~op[1],op[0],~func[2],~func[1],func[0]);  // and�����־
    and(i_or,~op[5],~op[4],~op[3],~op[2],~op[1],op[0],~func[2],func[1],~func[0]);   // or�����־
    and(i_xor,~op[5],~op[4],~op[3],~op[2],~op[1],op[0],func[2],~func[1],~func[0]);  // xor�����־

    and(i_sra,~op[5],~op[4],~op[3],~op[2],op[1],~op[0],~func[2],~func[1],func[0]);  // sra�����־
    and(i_srl,~op[5],~op[4],~op[3],~op[2],op[1],~op[0],~func[2],func[1],~func[0]);  // srl�����־
    and(i_sll,~op[5],~op[4],~op[3],~op[2],op[1],~op[0],~func[2],func[1],func[0]);   // sll�����־

    and(i_addi,~op[5],~op[4],~op[3],op[2],~op[1],op[0]);                            // addi�����־
    and(i_andi,~op[5],~op[4],op[3],~op[2],~op[1],op[0]);                            // andi�����־
    and(i_ori,~op[5],~op[4],op[3],~op[2],op[1],~op[0]);                             // ori�����־
    and(i_xori,~op[5],~op[4],op[3],op[2],~op[1],~op[0]);                            // xori�����־

    and(i_lw,~op[5],~op[4],op[3],op[2],~op[1],op[0]);                               // load�����־
    and(i_sw,~op[5],~op[4],op[3],op[2],op[1],~op[0]);                               // store�����־

    and(i_beq,~op[5],~op[4],op[3],op[2],op[1],op[0]);                               // beq�����־
    and(i_bne,~op[5],op[4],~op[3],~op[2],~op[1],~op[0]);                            // bne�����־

    and(i_j,~op[5],op[4],~op[3],~op[2],op[1],~op[0]);                               // jump�����־

    wire i_rs=i_add|i_and|i_or|i_xor|i_addi|i_andi|i_ori|i_xori|i_lw|i_beq|i_bne;   // rs�ֶΣ�Դ��������ʹ�ñ�־
    wire i_rt=i_add|i_and|i_or|i_xor|i_sra|i_srl|i_sll|i_sw|i_beq|i_bne;            // rt�ֶΣ�Դ��������ʹ�ñ�־

    ////////////////////////////////////////////�����źŵ�����/////////////////////////////////////////////////////////
    wire wreg_mid;
    assign wreg_mid=i_add|i_and|i_or|i_xor|i_sll|i_srl|i_sra|i_addi|i_andi|i_ori|i_xori|i_lw;		//�Ĵ���д�ź�
    and(wreg, wreg_mid, ~LOADDEPEN, ~CancelInst);
    assign regrt=i_addi|i_andi|i_ori|i_xori|i_lw;    //regrtΪ1ʱĿ�ļĴ�����rt������Ϊrd
    assign m2reg=i_lw;  //������д�ؼĴ�����Ϊ1ʱ���洢������д��Ĵ���������ALU���д��Ĵ���
    assign shift=i_sll|i_srl|i_sra;//ALUa��������ѡ��Ϊ1ʱALUa�����ʹ����λλ���ֶ�inst[19:15]
    assign aluimm=i_addi|i_andi|i_ori|i_xori|i_lw|i_sw;//ALUb��������ѡ��Ϊ1ʱALUb�����ʹ��������
    assign sext=i_addi|i_lw|i_sw|i_beq|i_bne;//Ϊ1ʱ������չ����������չ
    wire wmem_mid;
    assign wmem_mid=i_sw;//�洢��д�źţ�Ϊ1ʱд�洢��������д
    and(wmem, wmem_mid, ~LOADDEPEN, ~CancelInst);

    /* ����ǰ�� */
    always @(*) begin
        ADEPEN = 0; // ADEPEN = A
        BDEPEN = 0; // BDEPEN = B
        STOREDEPEN = 0; // STOREDEPEN = B
        // A
        if (shift) begin ADEPEN = 1; end
        else if (wreg_exe && (rs == rd_exe)) begin ADEPEN = 2; end  //exe
        else if (wreg_mem && (rs == rd_mem)) begin ADEPEN = 3; end // mem
        // B
        if (aluimm) begin BDEPEN = 1; end
        else if (wreg_exe && (rt == rd_exe)) begin BDEPEN = 2; end
        else if (wreg_mem && (rt == rd_mem)) begin BDEPEN = 3; end
        // STORE
        if (i_sw && wreg_exe && (rt == rd_exe)) begin STOREDEPEN = 2; end
        else if(i_sw && wreg_mem  && (rt == rd_mem)) begin STOREDEPEN = 3; end
    end

    reg [2:0] BState;
    reg isJ;
    initial begin
        BState = 3;
        isJ = 0;
        CancelInst = 0;
        LOADDEPEN = 0;
    end

    reg [5:0] op_exe, op_mem;
    always @(posedge Clock) begin
        op_mem = op_exe;
        op_exe = op;
    end

    /* ��ˮ����ͣ */
    always @(posedge Clock) begin
        LOADDEPEN = 0;
        /* load ����ð�� */
        if ((rs == rd_exe) && m2reg_exe && i_rs) LOADDEPEN = 1;
        if ((rt == rd_exe) && m2reg_exe && i_rt) LOADDEPEN = 1;
        if ((rd == rd_exe) && m2reg_exe && i_sw) LOADDEPEN = 1;
        /* Jump ����ð�� */
        if (op_mem == 6'b001111 && rsrtequ) isJ = 1;
        else if(op_mem == 6'b010000 && ~rsrtequ) isJ = 1;
        else isJ = 0;
        CancelInst = 0;
        /* ״̬ת�� */
        case (BState)
            3: begin
                if(op == 6'b010010) BState = 2;
                else if(op == 6'b001111 || op == 6'b010000) begin 
                    if (LOADDEPEN) begin BState = 5; end 
                    else begin BState = 0; end
                end
            end
            2: BState = 3;
            5: BState = 0; 
            0: BState = 1; 
            1: begin
                if (isJ) BState = 4;
                else BState = 3;
            end
            4: BState = 3;
        endcase
        /* ���� */
        case (BState)
            5: LOADDEPEN = 1;
            0: LOADDEPEN = 1;
            1: LOADDEPEN = 1;
            4: CancelInst = 1;
            2: CancelInst = 1;
        endcase
    end

    always @(*)
        if(!CancelInst) begin
            case (op)
                6'b000000: begin aluc<=3'b000; pcsource<=2'b00; end                                    // +; pc=pc+4
                6'b000001:
                    case (func[2:0])
                        3'b001: begin aluc<=3'b001; pcsource<=2'b00; end                               // and; pc=pc+4
                        3'b010: begin aluc<=3'b010; pcsource<=2'b00; end                               // or; pc=pc+4
                        3'b100: begin aluc<=3'b011; pcsource<=2'b00; end                               // xor; pc=pc+4
                    endcase
                6'b000010:
                    case (func[2:0])
                        3'b010: begin aluc<=3'b100; pcsource<=2'b00; end                               // srl; pc=pc+4
                        3'b011: begin aluc<=3'b101; pcsource<=2'b00; end                               // sll; pc=pc+4
                    endcase
                6'b000101: begin aluc<=3'b000; pcsource<=2'b00; end                                    // addi; pc=pc+4
                6'b001001: begin aluc<=3'b001; pcsource<=2'b00; end                                    // andi; pc=pc+4
                6'b001010: begin aluc<=3'b010; pcsource<=2'b00; end                                    // ori; pc=pc+4
                6'b001100: begin aluc<=3'b011; pcsource<=2'b00; end                                    // xori; pc=pc+4

                6'b001101: begin aluc<=3'b000; pcsource<=2'b00; end                                    // load; pc=pc+4
                6'b001110: begin aluc<=3'b000; pcsource<=2'b00; end                                    // store; pc=pc+4
                6'b001111: begin aluc<=3'b110; if(rsrtequ) pcsource<=2'b01; else pcsource<=2'b00; end  // beq; pc=bpc
                6'b010000: begin aluc<=3'b110; if(!rsrtequ) pcsource<=2'b01; else pcsource<=2'b00; end // beq; pc=bpc
                6'b010010: pcsource<=2'b10;                                                            // beq; pc=jpc
            endcase
        end else begin
            aluc <= 3'b000; pcsource <= 2'b00;
        end

endmodule
