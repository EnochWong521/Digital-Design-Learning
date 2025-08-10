`timescale 1ns/1ps

module counter_nbit_tb;

  localparam CNT_WIDTH = 4;
  reg  clk = 0, reset_n;
  wire [CNT_WIDTH-1:0] counter;
  reg  [CNT_WIDTH-1:0] expected;

  // DUT
  counter_nbit #(.CNT_WIDTH(CNT_WIDTH)) DUT (
    .clk(clk),
    .reset_n(reset_n),
    .counter(counter)
  );

  // Clock: 100 MHz
  always #5 clk = ~clk;

  // Golden model
  always @(posedge clk or negedge reset_n)
    if (!reset_n) expected <= 0;
    else          expected <= expected + 1'b1;

  initial begin
    // Reset
    reset_n = 0; expected = 0;
    repeat (2) @(posedge clk);
    reset_n = 1;

    // Run and check
    repeat (20) begin
      @(posedge clk);
      if (counter !== expected) $fatal("Mismatch: exp=%0d got=%0d", expected, counter);
    end

    // Mid-run reset
    reset_n = 0; @(posedge clk);
    if (counter !== 0) $fatal("Reset failed");
    reset_n = 1;

    repeat (5) begin
      @(posedge clk);
      if (counter !== expected) $fatal("Post-reset mismatch");
    end

    $display("PASS");
    $finish;
  end

endmodule
