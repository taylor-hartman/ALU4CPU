`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 08:36:40 PM
// Design Name: 
// Module Name: MUX_2to1_32bit
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


module MUX_2to1_32bit(out, in1, in2, select);
    input[31:0] in1, in2;
    input select;
    
    output [31:0] out;
    
    reg [31:0] out_int;
    
    always @ (*) begin
        if (select == 0) begin
            out_int = in1;
        end else begin
            out_int = in2;
        end
   end
   
   assign out = out_int;
    

endmodule