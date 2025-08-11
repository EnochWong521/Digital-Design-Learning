`timescale 1ns / 1ps

module clock_div_nbit
    #(parameter N = 3)
    (
    input wire clk, reset_n, 
    output wire clk_out
    );
    
    wire [N-1:0] counter;
    
    counter_nbit
        #(.CNT_WIDTH(N))
        COUNTER0
        (
        .clk(clk),
        .reset_n(reset_n),
        .counter(counter)
        );
        
    assign clk_out = counter[N-1];
    
endmodule
