`timescale 1ns / 1ps

module d_ff_sync_rstn_tb();
    reg d, reset_n;
    reg clk = 0;
    wire q, q_not;
    reg [1:0] delay;
    integer i;
    
    d_ff_sync_rstn DDF0(
        .reset_n(reset_n),
        .d(d),
        .clk(clk),
        .q(q),
        .q_not(q_not)
    );
    
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        reset_n = 0;
        d = 0;
        for (i=0; i<4; i=i+1) begin
            delay = $urandom_range(1, 3);
            #(delay) d = ~d;
        end
        
        reset_n = 1;
        for (i=0; i<4; i=i+1) begin
            delay = $urandom_range(1, 3);
            #(delay) d = ~d;
        end
        
        d = 1'b1;
        #0.2;
        reset_n = 0;
        
        #40;
        $stop;
    end
    
endmodule
