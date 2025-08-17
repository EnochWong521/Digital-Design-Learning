`timescale 1ns / 1ps

module ram_sp_async_read(
    input [3:0] addr,
    input [7:0] data_in,
    input write_en,
    input clk,
    output [7:0] data_out
    );
    
    reg [7:0] ram [0:15];
    
    always @(posedge clk) begin
        if (write_en)
            ram[addr] <= data_in;
    end
    
    assign data_out = ram[addr];
    
endmodule
