`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:16:02 09/28/2013 
// Design Name: 
// Module Name:    dff 
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

module dff(q, d, clk, rst);

//parameter D = 0;		

input		d, clk, rst; //declare inputs d and clk, 1 bit each
output reg	q;          //declare output q, 1 bit

always @(posedge clk) begin
    q=d;
    if(rst == 1'b1) //active high
        q = 0;
end

endmodule
