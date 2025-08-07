`timescale 1ns / 1ps

module shift_reg_piso_tb();
    reg sdi, reset_n, pl;
    reg [3:0] d;
    reg clk = 0;
    wire sdo;
    
    shift_reg_piso DUT (
        .sdi(sdi),
        .clk(clk),
        .reset_n(reset_n),
        .pl(pl),
        .d(d),
        .sdo(sdo)
    );
    
    //clock signal
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        // reset signals
        reset_n = 0;
        sdi = 0;
        pl = 0; 
        d = 4'b0000;
        #1;
        
        // start loading data signals
        reset_n = 1;
        @(posedge clk);
        pl = 1;
        d = 4'b0101;
        @(posedge clk);
        pl = 0;
        d = 4'b0000;
        repeat(4);
        
        // switch into siso mode 
        @(posedge clk);
        pl = 0;      
        sdi = 1; 
        @(posedge clk);
        sdi = 0;
        repeat(4);
    end
    
    initial begin
        #20;
        $stop;
    end

endmodule