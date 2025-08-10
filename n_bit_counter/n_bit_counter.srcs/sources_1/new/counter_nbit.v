`timescale 1ns / 1ps

module counter_nbit
    #(parameter CNT_WIDTH = 3)
    (
    input clk, reset_n, 
    output reg [CNT_WIDTH-1:0] counter
    );
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) 
            counter <= 0;
        else 
            counter <= counter + 1'b1;
    end
endmodule
