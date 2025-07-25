`timescale 1ns / 1ps

module tree_adder_procedural(
    input [3:0] a, b,
    input [7:0] c, d,
    output reg [4:0] sum1,
    output reg [8:0] sum2,
    output reg [9:0] sum3
);

    always @(a or b) begin
        sum1 = a + b;
    end
    
    always @(c or d) begin
        sum2 = c + d;
    end
    
    always @(*) begin
        sum3 = sum1 + sum2;
    end
endmodule