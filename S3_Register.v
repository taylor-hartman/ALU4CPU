`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2022 08:43:29 PM
// Design Name: 
// Module Name: S3_Register
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


module S3_Register(
    input clk,
	input rst,
	input [31:0] ALU_Result,
	input [4:0] S2_WriteSelect,
	input S2_WriteEnable,
	output reg [31:0] S3_Result,
	output reg [4:0] S3_WriteSelect,
	output reg S3_WriteEnable
   );

	always@(posedge clk)
		begin
		if (rst)
			begin
			S3_Result	<= 32'd0;
			S3_WriteSelect <= 5'd0;
			S3_WriteEnable <= 1'b0;
			end
		else
			begin
			S3_Result <= ALU_Result;
			S3_WriteSelect <= S2_WriteSelect;
			S3_WriteEnable <= S2_WriteEnable;
			end
		end

endmodule
