`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/24/2025 06:51:31 PM
// Design Name: 
// Module Name: tree_adder_procedural_tb
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


module tree_adder_procedural_tb();
    reg [3:0] a, b;
    reg [7:0] c, d;
    wire [4:0] sum1;
    wire [8:0] sum2;
    wire [9:0] sum3;
    
    integer i, j;
    integer k, l;
    
    tree_adder_procedural DUT(
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .sum1(sum1),
    .sum2(sum2),
    .sum3(sum3)
    );
    
    initial begin 
        $monitor("a = %b, b = %b, c = %b, d = %b, sum1 = %b, sum2 = %b, sum3 = %b", a, b, c, d, sum1, sum2, sum3);
    end
    
    initial begin
        // reset to known state
        a = 0; b = 0; c = 0; d = 0;  
        #5;
    
        // some directed test vectors
        a = 4'hA; b = 4'h5; c = 8'hFF; d = 8'h01; #5;
        a = 4'hF; b = 4'h1; c = 8'h80; d = 8'h80; #5;

        // small exhaustive loops on a,b
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                a = i; b = j;   #2;
            end
        end

        // small exhaustive loops on c,d
        for (k = 0; k < 4; k = k + 1) begin
            for (l = 0; l < 4; l = l + 1) begin
                c = k; d = l; #2;
            end
        end

        // final randomish vectors
        a = 4'd7; b = 4'd9; c = 8'd42; d = 8'd100; #5;

        // Done
        $stop;
    end
endmodule
