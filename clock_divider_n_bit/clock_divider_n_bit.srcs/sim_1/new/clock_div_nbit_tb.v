`timescale 1ns / 1ps

module tb_clock_div_nbit;

    // Parameters
    localparam N = 3; // divide-by 2^N = 8

    // Testbench signals
    reg clk;
    reg reset_n;
    wire clk_out;

    // Instantiate DUT
    clock_div_nbit #(.N(N)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .clk_out(clk_out)
    );

    // Clock generation: 100 MHz (10 ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Reset sequence and simulation control
    initial begin
        reset_n = 0;
        #20;         // hold reset low for 20 ns
        reset_n = 1; // release reset
        #200;        // run for some time
        $stop;       // end simulation
    end

    // Monitor output
    initial begin
        $monitor("%0t ns: clk=%b reset_n=%b clk_out=%b",
                  $time, clk, reset_n, clk_out);
    end

endmodule
