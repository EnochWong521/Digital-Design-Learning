`timescale 1ns / 1ps

module shift_reg_pipo(
    input [3:0] p,
    input clk, reset_n,
    output reg [3:0] q
    );
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= 4'b0;
        else 
            q[3:0] <= p[3:0];
    end

endmodule