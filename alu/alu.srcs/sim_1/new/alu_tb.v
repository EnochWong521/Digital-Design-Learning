`timescale 1ns / 1ps

module alu_tb();

    parameter BUS_WIDTH = 8;
    reg [3:0] op_code;
    reg [BUS_WIDTH-1:0] a, b;
    reg carry_in;
    wire [BUS_WIDTH-1:0] y;
    wire borrow;
    wire zero;
    wire parity;
    wire invalid_op;
    
    alu
    #(.BUS_WIDTH(BUS_WIDTH))
    ALU1 (
        .a(a),
        .b(b),
        .carry_in(carry_in),
        .op_code(op_code),
        .y(y),
        .borrow(borrow),
        .zero(zero),
        .parity(parity),
        .invalid_op(invalid_op)
    );
    
    initial begin
        // Print header
        $display("time | op  |  a   |  b   | Cin |    y   | brw | z | p | inv");
        $monitor("%4t | %0d   | %3d | %3d |  %b  | %3d    |  %b  | %b | %b |  %b",
                 $time, op_code, a, b, carry_in, y, borrow, zero, parity, invalid_op);
    
        // Test each opcode with a simple vector
        // 1: ADD
        op_code = 4'd1; a = 8'd10;  b = 8'd20;  carry_in = 1'b0; #10;
        // 2: ADD with carry
        op_code = 4'd2; a = 8'd200; b = 8'd100; carry_in = 1'b1; #10;
        // 3: SUB
        op_code = 4'd3; a = 8'd50;  b = 8'd75;  carry_in = 1'b0; #10;
        // 4: INC
        op_code = 4'd4; a = 8'd255; b = 8'd0;   carry_in = 1'b0; #10;
        // 5: DEC
        op_code = 4'd5; a = 8'd0;   b = 8'd0;   carry_in = 1'b0; #10;
        // 6: AND
        op_code = 4'd6; a = 8'b10101010; b = 8'b11001100; carry_in = 1'b0; #10;
        // 7: NOT
        op_code = 4'd7; a = 8'b11110000; b = 8'b0;        carry_in = 1'b0; #10;
        // 8: ROL
        op_code = 4'd8; a = 8'b10000001; b = 8'b0;        carry_in = 1'b0; #10;
        // 9: ROR
        op_code = 4'd9; a = 8'b10000001; b = 8'b0;        carry_in = 1'b0; #10;
    
        // test invalid opcode (should set invalid_op)
        op_code = 4'd15; a = 8'd123; b = 8'd45; carry_in = 1'b0; #10;
    
        $stop;
  end

endmodule
