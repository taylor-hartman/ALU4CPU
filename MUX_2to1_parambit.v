`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/14/2022 08:18:25 PM
// Design Name: 
// Module Name: MUX_2to1_parambit
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


module MUX_7to1_parambit(out, in1, in2, in3, in4, in5, in6, in7, select);
    
    parameter size = 1;
    
    input [size-1:0] in1, in2, in3, in4, in5, in6, in7;
    input [2:0] select;
    
    output [size-1:0] out;
    
    reg [size-1:0] out_int;
    
    always @ (*) begin
        case(select)
            3'b000:
                out_int = in1;
            3'b001:
               out_int = in2;
            3'b011:
                out_int = in3;
            3'b100:
               out_int = in4;
            3'b110:
                out_int = in5;
            3'b101:
               out_int = in6;
            3'b111:
                out_int = in7;
       endcase
    end
   
   assign out = out_int;

endmodule
