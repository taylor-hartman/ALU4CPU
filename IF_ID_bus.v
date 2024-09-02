`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 03:59:21 PM
// Design Name: 
// Module Name: IF_ID_bus
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


module IF_ID_bus(rs1, rs2, imm, data_src, alu_op, write_select, write_en, instruction, clk, rst);
    output [4:0] rs1, rs2;
    output [15:0] imm;
    output data_src, write_en;
    output [2:0] alu_op;
    output [4:0] write_select;
    
    input [31:0] instruction;
    input clk, rst;
    
    wire [5:0] opcode; 
        
    //rs1 is r2; rs2 is r3;
    register_param #(5) RS1(rs1, instruction[20:16], clk, rst);
    register_param #(5) RS2(rs2, instruction[15:11], clk, rst);
    
    
    register_param #(16) IMM(imm, instruction[15:0], clk, rst);
    
    //R type ? data_src = 0 : data_src = 1; aka 1 => immediate
    register_param #(1) Data_Src(data_src, instruction[29], clk, rst);
    
    register_param #(6) ALU_OP(alu_op, instruction[28:26], clk, rst);
    
    //r1 is write select. 
    register_param #(5) (write_select, instruction[25:21], clk, rst);
    
    //if R type instruction then write en is 1 (active high)
    //actually write en should always be 1, there are only ALU ops here
    register_param #(1) Write_EN(write_en, 1, clk, rst); 
    
endmodule
