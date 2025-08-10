`timescale 1ns / 1ps

module shift_left_right_load_reg_tb();
    reg load_enable, shift_left_right, reset_n;
    reg clk = 0;
    reg [7:0] i;
    wire [7:0] q;
    
    shift_left_right_load_reg DUT(
        .load_enable(load_enable),
        .shift_left_right(shift_left_right),
        .reset_n(reset_n),
        .clk(clk),
        .i(i),
        .q(q)
    );
    
    // clock
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        // reset signals
        load_enable = 0;
        shift_left_right = 0;
        reset_n = 0;
        i = 8'h00;
        #1;
        
        // start loading signals
        reset_n = 1;
        load_enable = 1;
        
        // shift left
        @(posedge clk);
        shift_left_right = 0;
        i = 8'b0101_0101;
        @(posedge clk);
        load_enable = 0;
        repeat (5) @(posedge clk);
        
        // shift right
        @(posedge clk);
        load_enable = 1;
        shift_left_right = 1;
        i = 8'b1111_1111;
        @(posedge clk);
        load_enable = 0;
        
        #10;
        $stop;
    end
endmodule