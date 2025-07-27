`timescale 1ns / 1ps

module decoder_4_16_tb();
    reg [4:0] a;
    reg enable;
    wire [15:0] d;
    
    integer i;
    
    decoder_4_16 DUT(
    .a(a),
    .enable(enable),
    .d(d)
    );
    
    initial begin
        $monitor("a = %b, enable = %b. d = %b", a, enable, d);
        enable = 1;
        for (i = 0; i < 32; i = i + 1) begin
            #1; 
            a = i;
        end
    end
endmodule 