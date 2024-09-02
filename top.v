`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 03:45:09 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(out, instruction, clk, rst);
    output [31:0] out;
    input [31:0] instruction;
    input clk, rst;
    
    wire [4:0] S1_ReadSelect1, S1_ReadSelect2, S1_WriteSelect;
    wire S1_WriteEnable, S1_DataSrc;
    wire [2:0] S1_ALUOP;
    wire [15:0] S1_Imm;
    
    S1_Register S1(clk, rst, instruction, S1_ReadSelect1, S1_ReadSelect2, S1_WriteSelect, S1_WriteEnable, S1_Imm, S1_DataSrc, S1_ALUOP);
    
    wire [31:0] Reg_ReadData1, Reg_ReadData2;
    
    wire [31:0] S3_Result;
    wire [4:0] S3_WriteSelect;
    wire S3_WriteEnable;
    
    nbit_register_file Stage2Reg(S3_Result, Reg_ReadData1, Reg_ReadData2, 
        S1_ReadSelect1, S1_ReadSelect2, 
        S3_WriteSelect, S3_WriteEnable, clk);
    
    wire [31:0] S2_ReadData1, S2_ReadData2;
    wire [15:0] S2_Imm;
    wire S2_DataSrc;
    wire [2:0] S2_ALUOP;
    wire [4:0] S2_WriteSelect;
    wire S2_WriteEnable;
     
    S2_Register S2(
        clk,
         rst,
         Reg_ReadData1,
         Reg_ReadData2, S1_Imm,
         S1_DataSrc,
         S1_ALUOP,
         S1_WriteSelect,
         S1_WriteEnable,
         S2_ReadData1,
         S2_ReadData2,
         S2_Imm,
         S2_DataSrc,
         S2_ALUOP,
         S2_WriteSelect,
        S2_WriteEnable
        );
    
    wire [31:0] ALU_In2;
    wire [31:0] Imm_to_ALU;
    assign Imm_to_ALU[31:16] = 15'd0;
    assign Imm_to_ALU[15:0] = S2_Imm;
    
    MUX_2to1_32bit MUX0(ALU_In2, S2_ReadData2, Imm_to_ALU, S2_DataSrc);
    
    wire c_out;
    wire [31:0] ALU_Result;
    ALU #(32) ALU0(c_out, ALU_Result, S2_ReadData1, ALU_In2, S2_ALUOP, clk);
    
    S3_Register S3(clk, rst, ALU_Result, S2_WriteSelect, S2_WriteEnable, S3_Result, S3_WriteSelect, S3_WriteEnable);
    
    assign out = S3_Result;
   
endmodule