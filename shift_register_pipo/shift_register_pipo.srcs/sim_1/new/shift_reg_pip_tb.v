`timescale 1ns / 1ps

module shift_reg_pipo_tb();
    reg clk = 0; 
    reg reset_n;
    reg [3:0] p;
    wire [3:0] q;
    
    integer i;
    
    shift_reg_pipo PIPO0(
        .clk(clk),
        .reset_n(reset_n),
        .p(p),
        .q(q)
    );
    
    //clock signal
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        reset_n = 0;
        for (i=0; i<16; i=i+1) begin
            #1;
            p = i;
        end
        
        reset_n = 1;    
        for (i=0; i<16; i=i+1) begin
            #1;
            p = i;
        end
        #20;
        $finish;
    end
    
endmodule