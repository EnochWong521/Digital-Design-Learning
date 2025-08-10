`timescale 1ns / 1ps

module lfsr_16(
    input clk, enable, reset_n,
    output reg [15:0] lfsr
    );
    
    wire feedback;
    localparam RST_SEED = 16'h1001;
    
    // x^16 + x^14 + x^12 + x^11 + 1
    assign feedback = lfsr[0] ^ lfsr[10] ^ lfsr[12] ^ lfsr[13] ^ lfsr[15];
    
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            lfsr <= RST_SEED;
        else if (enable)
            lfsr <= {lfsr[14:0], feedback};
    end
endmodule
