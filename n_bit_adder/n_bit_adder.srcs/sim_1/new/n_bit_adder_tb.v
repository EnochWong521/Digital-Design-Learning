`timescale 1ns / 1ps

module n_bit_adder_tb();
    parameter ADDER_WIDTH = 10;
    reg [ADDER_WIDTH-1:0] a, b;
    wire [ADDER_WIDTH:0] sum;
    
    n_bit_adder 
    #(.N(ADDER_WIDTH))
    DUT
    (
        .a(a),
        .b(b),
        .sum(sum)
    );
    
    initial begin
        $monitor("a = %d, b = %d, sum = %d", a, b, sum);
    end
    
    initial begin
        #10; a = 0; b = 0;
        #10; a = 1; b = 99;
        #10; a = 33; b = 66;
        #10; a = 100; b = 47;
        #10;
    end
endmodule