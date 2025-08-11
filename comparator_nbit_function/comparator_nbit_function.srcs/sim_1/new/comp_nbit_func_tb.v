`timescale 1ns / 1ps

module comp_nbit_func_tb;

    // Parameter
    localparam CMP_WIDTH = 4;

    // Testbench signals
    reg  [CMP_WIDTH-1:0] a, b;
    wire greater, equal, smaller;

    // Instantiate the DUT
    comp_nbit_func #(.CMP_WIDTH(CMP_WIDTH)) uut (
        .a(a),
        .b(b),
        .greater(greater),
        .equal(equal),
        .smaller(smaller)
    );

    // Test sequence
    initial begin
        // Case 1: a < b
        a = 4'd3; b = 4'd7;
        #10;

        // Case 2: a == b
        a = 4'd5; b = 4'd5;
        #10;

        // Case 3: a > b
        a = 4'd10; b = 4'd2;
        #10;

        // Case 4: min values
        a = 4'd0; b = 4'd0;
        #10;

        // Case 5: max values
        a = 4'd15; b = 4'd15;
        #10;

        // Finish simulation
        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("%0t ns: a=%0d b=%0d | greater=%b equal=%b smaller=%b",
                  $time, a, b, greater, equal, smaller);
    end

endmodule
