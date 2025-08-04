`timescale 1ns / 1ps

module shift_reg_sipo_tb();
    reg sdi, reset_n;
    reg clk = 0;
    wire [3:0]q;
    
    shift_reg_sipo DUT(
        .sdi(sdi),
        .clk(clk),
        .reset_n(reset_n),
        .q(q)
    );
    
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        sdi = 0;
        reset_n = 0;
        #1;
        reset_n = 1;
        
        @(posedge clk);
        sdi = 1;    
        
        @(posedge clk);
        sdi = 0;
        repeat(4) @(posedge clk);
        
        sdi = 1;
        repeat(2) @(posedge clk);
        
        sdi = 0;
        repeat(4) @(posedge clk);
        
        $finish;
    end
endmodule