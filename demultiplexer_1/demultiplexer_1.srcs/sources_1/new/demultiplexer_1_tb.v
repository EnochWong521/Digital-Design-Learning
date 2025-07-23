`timescale 1ns / 1ps

module demultiplexer_1_tb();
    reg x, s;
    wire y0, y1;
    
    integer i;
    
    demultiplexer_1 DUT(
    .x(x),
    .s(s),
    .y0(y0),
    .y1(y1)
    );
    
    initial begin
        $monitor("x = %b, s = %b, y0 = %b, y1 = %b", x, s, y0, y1);
    end
    
    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            {x, s} = i;
            #10;
        end
        $stop;
    end
    
endmodule
