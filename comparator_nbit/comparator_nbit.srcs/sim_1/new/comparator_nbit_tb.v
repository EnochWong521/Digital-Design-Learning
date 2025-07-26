`timescale 1ns / 1ps

module comparator_nbit_tb();
    parameter CMP_WIDTH = 10;
    reg [CMP_WIDTH-1:0] a, b;
    wire smaller, equal, larger;
    
    comparator_nbit 
    #(.N(CMP_WIDTH))
    DUT(
        .a(a),
        .b(b),
        .smaller(smaller),
        .equal(equal),
        .larger(larger)
    );
    
    initial begin
        $monitor("a = %d, b = %d, smaller = %d, equal = %d, greater = %d", a, b, smaller, equal, larger);
    end
    
    initial begin
        #1; a = 0; b = 0;
        #1; a = 20; b = 40;
        #1; a = 55; b = 17;
    end
endmodule