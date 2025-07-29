`timescale 1ns / 1ps

module clkgen();
    parameter CLK1_HALF_PERIOD = 0.5;
    parameter CLK2_HALF_PERIOD = 0.25;
    
    reg clk1;
    reg clk2 = 0;
    initial begin
       clk1 = 0;
       forever begin
        #(CLK1_HALF_PERIOD);
        clk1 = ~clk1;
       end 
    end
    
    always begin
        #(CLK2_HALF_PERIOD);
        clk2 = ~clk2;
    end
endmodule
