`timescale 1ns / 1ps

module d_ff_sync_rstn(
    input reset_n,
    input clk,
    input d,
    output reg q,
    output q_not
    );
    
    always @(posedge clk) begin
        if (!reset_n)
            q <= 1'b0;
        else
            q <= d;
    end
    
    assign q_not = ~q;
    
endmodule
