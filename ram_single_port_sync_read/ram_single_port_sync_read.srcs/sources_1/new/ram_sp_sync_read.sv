`timescale 1ns / 1ps

module ram_sp_sync_read(
    input logic clk,
    input logic write_en,
    input logic [7:0] data_in,
    input logic [3:0]  address,
    output logic [7:0] data_out
    );
    
    logic [7:0] ram [0:15];
    logic [3:0] read_addr;
    
    always_ff @(posedge clk) begin
        if (write_en) 
            ram[address] <= data_in;
        read_addr <= address;
        data_out = ram[read_addr];
    end
    
    // assertions
    // check address
    assert property (@(posedge clk) address < 16) else $error("Address out of bound: %0b", address);
    
endmodule