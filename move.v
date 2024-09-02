`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 03:53:22 PM
// Design Name: 
// Module Name: move
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


//gate delay 0
module move(result, a);
    
    parameter size = 1;
    
    input [size-1:0] a;
    output [size-1:0] result;
    
    assign result = a;
    
endmodule
