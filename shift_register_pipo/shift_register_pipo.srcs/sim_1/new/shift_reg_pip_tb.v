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
        // reset circuit
        #1;
        reset_n = 0;
        p = 0;
        #1.3;
        
        //release reset
        reset_n = 1;
        
        for(i=0;i<10;i=i+1) begin
            @(posedge clk);
            p = $random;
        end
        
        $finish;
    end
    
endmodule