`timescale 1ns / 1ps

module comp_nbit_func
    #(parameter CMP_WIDTH = 4)
    (
    input [CMP_WIDTH-1:0] a, b,
    output reg greater, equal, smaller
    );
    
    // comparator function
    function [2:0]comparator(input [CMP_WIDTH-1:0] a, input [CMP_WIDTH-1:0] b);
        reg greater_local, equal_local, smaller_local;
        begin
            greater_local = (a > b);
            equal_local = (a == b);
            smaller_local = (a < b);
            comparator = {greater_local, equal_local, smaller_local};
        end    
    endfunction
    
    always @(*) begin
        {greater, equal, smaller} = comparator(a, b);
    end
    
endmodule
