`timescale 1ns / 1ps

module encoder_8_3_tb();
    reg [7:0] d;
    reg enable;
    wire [2:0] y;
    
    integer i;
    
    encoder_8_3 DUT(
        .d(d),
        .enable(enable),
        .y(y)
    );
    
    initial begin
        enable = 1;
        for (i = 0; i < 8; i = i + 1) begin
            # 10;
            d = (8'b0000_0001 << i);
        end
    end
endmodule