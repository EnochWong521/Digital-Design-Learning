`timescale 1ns / 1ps

module decoder_4_16(
    input [3:0] a,
    input enable,
    output [15:0] y
    );
    
    wire en1 = ~a[3] & enable;
    wire en2 = a[3] & enable;
    
    decoder_3_8 DECODER1(
        .a(a[2:0]),
        .enable(en1),
        .y(y[7:0])
    );
    
    decoder_3_8 DECODER2(
        .a(a[2:0]),
        .enable(en2),
        .y(y[15:8])
    );
    
endmodule