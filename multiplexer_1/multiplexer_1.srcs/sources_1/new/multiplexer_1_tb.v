`timescale 1ns / 1ps

module multiplexer_1_tb();
    reg a, b, s;
    wire y;
    
    integer i;
    
    multiplexer_1 DUT(
    .a(a),
    .b(b),
    .s(s),
    .y(y)
    );
    
    initial begin
        $monitor("a = %b, b = %b, s = %b, y = %b", a, b, s, y);
    end
    
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, s} = i;
            #1;
        end
        $stop;
    end
    
endmodule