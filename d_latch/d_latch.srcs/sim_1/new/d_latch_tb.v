`timescale 1ns / 1ps

module d_latch_tb();
    reg d, enable;
    wire q, q_not;
    
    integer i;
    
    d_latch D_LATCH1(
    .d(d),
    .enable(enable),
    .q(q),
    .q_not(q_not)
    );
    
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            {enable, d} = i;
        end
    end
endmodule