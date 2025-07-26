`timescale 1ns / 1ps

module decode_nbit_tb();
    parameter WIDTH = 3;
    reg [WIDTH-1:0] a;
    reg enable;
    wire [2**WIDTH-1:0] y;
    
    integer i;
    
    decoder_nbit 
    #(.N(WIDTH))
    DUT(
    .a(a),
    .enable(enable),
    .y(y)
    );
    
    initial begin
        $monitor("a = %b, enable = %b, y = %b", a, enable, y);
        enable = 1;
        for (i = 0; i < 2**WIDTH; i = i + 1) begin
            #1; a = i;
        end
    end
endmodule