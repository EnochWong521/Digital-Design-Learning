`timescale 1ns / 1ps

module ram_sp_sync_read_tb();
    logic clk = 0;
    logic [7:0] data_in;
    logic write_en;
    logic [3:0] address;
    logic [7:0] data_out;
    
    logic [7:0] wr_data;
    
    integer success_count = 0;
    integer error_count = 0;
    integer test_count = 0;
    
    integer i;
    
    ram_sp_sync_read DUT(
        .clk(clk),
        .data_in(data_in),
        .write_en(write_en),
        .address(address),
        .data_out(data_out)
    );
    
    task automatic write_data(input [3:0] addr, input [7:0] d_in);
        begin
            @(negedge clk);
            write_en = 1;
            address = addr;
            data_in = d_in;
            @(posedge clk);
            @(negedge clk);
            write_en = 0;
        end
    endtask
    
    task automatic read_data(input [3:0] addr);
        begin
            @(negedge clk);
            address = addr;
            @(posedge clk);
            @(negedge clk);
        end
    endtask
    
    //compare write data with read data
    task automatic compare_data(input [3:0] addr, input [7:0] expected_data, input [7:0] observed_data);
        begin
            if (expected_data == observed_data) begin
                $display($time, "SUCCESS Address = %0b, Expected = %0b, Observed = %0b", addr, expected_data, observed_data);
                success_count++;
            end
            else begin
                $display($time, "ERROR Address = %0b, Expected = %0b, Observed = %0b", addr, expected_data, observed_data);
                error_count++;
            end
            test_count++;
        end
    endtask
    
    always begin
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        // reset signals
        data_in = '0;
        write_en = 0;
        address = '0;
        #1;
        
        for (i=0; i<16; i=i+1) begin
            wr_data = $urandom_range(255, 0);
            write_data(i, wr_data);
            read_data(i);
            compare_data(i, wr_data, data_out);
            repeat ($urandom_range(0, 3)) @(posedge clk);
        end
        
        $display("Summary: Success count: %0d, Error count: %0d, Test count: %0d", success_count, error_count, test_count);
        
        #60;
        $finish;
    end
endmodule