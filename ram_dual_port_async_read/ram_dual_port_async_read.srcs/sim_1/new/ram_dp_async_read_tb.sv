`timescale 1ns / 1ps

module ram_dp_async_read_tb();

    localparam WIDTH = 8;
    localparam DEPTH = 16;
    localparam DEPTH_LOG = $clog2(DEPTH);

    logic clk = 0;
    logic [WIDTH-1:0] data_wr;
    logic [DEPTH_LOG-1:0] address_rd;
    logic [DEPTH_LOG-1:0] address_wr;
    logic we_n;
    logic [WIDTH-1:0] data_rd;
    
    logic [7:0] wr_temp; 
    
    integer success = 0;
    integer error = 0;
    integer count = 0;
    integer i;
    
    ram_dp_async_read 
    #(
        .WIDTH(WIDTH), 
        .DEPTH(DEPTH)
    ) 
    DUT(
        .clk(clk),
        .data_wr(data_wr),
        .address_rd(address_rd),
        .address_wr(address_wr),
        .we_n(we_n),
        .data_rd(data_rd)
    );
    
    task automatic read_data(input [DEPTH_LOG-1:0] addr_rd);
        @(negedge clk);
        we_n = 1;
        address_rd = addr_rd;
    endtask
    
    task automatic write_data(input [DEPTH_LOG-1:0] addr_wr, input [WIDTH-1:0] d_wr);
        @(negedge clk);
        we_n = 0;
        address_wr = addr_wr;
        data_wr = d_wr;
        @(posedge clk);
        @(negedge clk);
        we_n = 1;
    endtask
    
    task automatic compare_data(input [DEPTH_LOG-1:0] addr, input [WIDTH-1:0] expected_data, input [WIDTH-1:0] observed_data);
        if (expected_data === observed_data) begin
            $display("%0t SUCCESS Address: %0h, Expected: %0h, Observed: %0h", $time, addr, expected_data, observed_data);
            success++;
        end
        else begin
            $display("%0t ERROR Address: %0h, Expected: %0h, Observed: %0h", $time, addr, expected_data, observed_data);
            error++;
        end
        count++;
    endtask
    
    always #0.5 clk = ~clk;
    
    initial begin
        // reset 
        we_n = 1;
        address_wr = '0;
        address_rd = '0;
        #1;
        
        // loop through SRAM
        for (i=0; i<16; i++) begin
            wr_temp = $urandom_range(255, 0);
            write_data(i, wr_temp);
            read_data(i);
            compare_data(i, wr_temp, data_rd);
            repeat($urandom_range(3, 0)) @(posedge clk);
        end
        $finish;
    end
    
endmodule