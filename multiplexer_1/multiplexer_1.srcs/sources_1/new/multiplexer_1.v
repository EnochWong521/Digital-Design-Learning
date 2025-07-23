`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 07:26:48 AM
// Design Name: 
// Module Name: multiplexer_1
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


module multiplexer_1(
    input a, 
    input b,
    input s,
    output y
    );
    
    wire not_s;
    wire bit1;
    wire bit2;
    
    not NOT1 (not_s, s);
    and AND1 (bit1, a, not_s);
    and AND2 (bit2, b, s);
    
    or OR1(y, bit1, bit2);
    
endmodule
