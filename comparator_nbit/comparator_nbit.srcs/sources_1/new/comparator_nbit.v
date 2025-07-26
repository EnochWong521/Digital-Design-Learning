`timescale 1ns / 1ps

module comparator_nbit
    #(parameter N = 3)
    (
    input [N-1:0] a, b,
    output reg smaller, equal, larger
    );
    always @(*) begin
        smaller = (a < b);
        equal = (a == b);
        larger = (a > b);
    end
endmodule