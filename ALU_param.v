`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2022 03:48:20 PM
// Design Name: 
// Module Name: ALU
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


module ALU(c_out, result, a, b, select, clk);
    
    parameter size = 32;

    input clk;
    input [size-1:0] a, b; //a is r2 b is r3
    input [2:0] select;
    output c_out;
    output [size-1:0] result;
    
    wire [size-1:0] mov_out, not_out, and_out, or_out, add_out, sub_out;
    wire [size:0] add_carries, sub_carries;
//    assign add_carries[0] = 0;
//    assign sub_carries[0] = 1;

    adder_subtractor_param add0(add_carries[1], add_out[0], a[0], b[0], 1'b0, 1'b0);
    adder_subtractor_param sub0(sub_carries[1], sub_out[0], a[0], b[0], 1'b1, 1'b1);
    
    //instead of making a seperate module for 1 bit ALU each loop here represents a 1 bit ALU
    genvar i;
    generate
        for(i = 0; i < size; i = i + 1) begin
            move mov0(mov_out[i], a[i]);
            bit_not_param not0(not_out[i], a[i]);
            AND_param nand0(and_out[i], a[i], b[i]);
            or_param or0(or_out[i], a[i], b[i]);             
        end
        for(i = 1; i < size; i = i + 1) begin
            adder_subtractor_param add1(add_carries[i + 1], add_out[i], a[i], b[i], add_carries[i], 1'b0);
            adder_subtractor_param sub1(sub_carries[i + 1], sub_out[i], a[i], b[i], sub_carries[i], 1'b1);
        end
    endgenerate
    
    wire [31:0] slt_out;
    SLT_param #(32) SLT0(slt_out, a, b);
    
    defparam MUX0.size = size;
    MUX_7to1_parambit MUX0(result, not_out, mov_out, or_out, and_out, sub_out, add_out, slt_out, select);
    
    assign c_out = add_carries[size];
        
endmodule