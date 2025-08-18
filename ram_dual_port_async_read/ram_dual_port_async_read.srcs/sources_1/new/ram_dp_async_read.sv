`timescale 1ns / 1ps

module ram_dp_async_read#(parameter WIDTH = 8, parameter DEPTH = 16)
(
    input logic clk,
    input logic [WIDTH-1:0] data_wr,
    input logic [$clog2(DEPTH)-1:0] address_rd,
    input logic [$clog2(DEPTH)-1:0] address_wr,
    input logic we_n,
    output logic [WIDTH-1:0] data_rd
);

    logic [WIDTH-1:0] ram [0: DEPTH-1];
    
    always_ff @(posedge clk) begin
        if (!we_n)
            ram[address_wr] <= data_wr;
    end
    
    assign data_rd = ram[address_rd];

endmodule