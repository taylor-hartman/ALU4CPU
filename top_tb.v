`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 08:57:46 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    wire [31:0] out;
    reg [31:0] instruction;
    reg clk, rst;
    
    top T1(out, instruction, clk, rst);
    
    initial begin
		
		clk = 0;
		rst = 1;
		instruction = 32'h00000000; 
		#20
		rst = 0;
		#10;
		
		instruction = 32'b01110100001000010000000000001010; 
		#10;
		instruction = 32'b01101100010000100000000000000010;
		#30;
		instruction = 32'b01010100011000010001000000000000; 
		#10;
		instruction = 32'b01011000100000010001000000000000; 
		#10;
		instruction = 32'b010000_00011_00001_0000000000000000; //Register 3= not R1
		#10
		instruction = 32'b011001_00100_00001_0000000000000000; //Register 4 = move R1
		#30
		instruction = 32'b010100_00100_00011_00100_00000000000; //Register 4 = r3 and r4
		#30
		instruction = 32'b011111_00100_00001_0000000000000000; //Register 4 = SLT(R1, 0);
		#10
		instruction = 32'd0;
        #20
        rst = 1;
        #10;
        
        
        #50;
        $finish;
        
	end
	
	always
	   #5 clk = ~clk;
	   
endmodule
