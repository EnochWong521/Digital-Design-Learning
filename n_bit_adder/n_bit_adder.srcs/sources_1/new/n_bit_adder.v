`timescale 1ns / 1ps

module n_bit_adder
    // parameter
    #(parameter N = 3)
    // ports
    (input [N-1:0] a,
     input [N-1:0] b,
     output reg [N:0] sum);
     
    always @(a or b) begin
        sum = a + b;
    end
    
endmodule