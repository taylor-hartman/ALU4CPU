`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 07:19:53 PM
// Design Name: 
// Module Name: stage2_register
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


module stage2_register(rd1, rd2, rs1, rs2, write_data, write_select, write_en);
    
    output [31:0] rd1, rd2;
    
    input [4:0] rs1, rs2;
    input [31:0] write_data;
    input [4:0] write_select;
    input write_en;
    
    reg [1023:0] register;
    
    always @ (*) begin
        for(i=0;i<32;i=i+1) begin
            register[(i + 1) * 32: i * 32] = write_data;
        end
    end
   
     
        
        
endmodule
