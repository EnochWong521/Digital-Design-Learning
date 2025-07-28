`timescale 1ns / 1ps

module prio_enc_4_2_tb();
    reg [3:0]d;
    wire [1:0]q;
    wire v;
    
    integer i;
    
    prio_enc_4_2 DUT(
        .d(d),
        .q(q),
        .v(v)
    );
    
    initial begin
        for (i = 0; i < 16; i = i + 1) begin
            d = i; #10;    
        end
    end

endmodule