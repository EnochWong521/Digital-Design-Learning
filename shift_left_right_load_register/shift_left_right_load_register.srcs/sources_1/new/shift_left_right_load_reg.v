`timescale 1ns / 1ps

module shift_left_right_load_reg(
    input reset_n, load_enable, shift_left_right, clk,
    input [7:0] i,
    output reg [7:0] q
    );
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            q <= 8'h00; // reset
        else if (load_enable)
            q <= i; // load
        else begin
            if (shift_left_right)
                q <= {q[6:0], 1'b0}; // shift left
            else 
                q <= {1'b0, q[7:1]}; // shift right
        end  
    end
endmodule