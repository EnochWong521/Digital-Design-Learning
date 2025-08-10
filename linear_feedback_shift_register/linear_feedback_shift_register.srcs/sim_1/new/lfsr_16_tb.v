`timescale 1ns / 1ps

module lfsr_16_tb;

    // Testbench signals
    reg clk;
    reg enable;
    reg reset_n;
    wire [15:0] lfsr;

    // DUT instance
    lfsr_16 uut (
        .clk(clk),
        .enable(enable),
        .reset_n(reset_n),
        .lfsr(lfsr)
    );

    // Clock generation: 10 ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Initialize
        reset_n = 0;
        enable  = 0;

        // Apply reset
        #12;
        reset_n = 1; // release reset

        // Enable LFSR
        #5;
        enable = 1;

        // Run for a number of cycles
        repeat (50) begin
            @(posedge clk);
            $display("Time %0t: LFSR = %h", $time, lfsr);
        end

        // Disable and re-enable for testing
        enable = 0;
        repeat (5) @(posedge clk);
        enable = 1;
        repeat (10) @(posedge clk);

        $stop;
    end

endmodule
