`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 08:47:01 AM
// Design Name: 
// Module Name: demultiplexer_1_tb
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


module demultiplexer_1(
    input x, s,
    output y0, y1
    );
    
    wire not_s;
    
    not NOT1(not_s, s);
    and AND1(y0, x, not_s);
    and AND2(y1, x, s);
    
endmodule
