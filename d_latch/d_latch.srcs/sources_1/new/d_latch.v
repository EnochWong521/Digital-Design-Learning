`timescale 1ns / 1ps

module d_latch(
    input d, enable,
    output q, q_not
    );
    
    reg dlatch;
    
    always @(enable or d) begin
        if (enable)
            dlatch <= d;
    end

    assign q = dlatch;
    assign q_not = ~q;

endmodule