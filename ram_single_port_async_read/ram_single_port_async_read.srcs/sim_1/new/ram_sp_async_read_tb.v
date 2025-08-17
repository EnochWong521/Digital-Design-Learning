`timescale 1ns / 1ps

module ram_sp_async_read_tb();
    reg clk = 0;
    reg write_en;
    reg [3:0] addr;
    reg [7:0] data_in;
    reg [7:0] wr_data;
    reg [2:0] delay; 
    wire [7:0] data_out;
    
    integer success_count = 0;
    integer error_count = 0;
    integer test_count = 0;
    integer i;
    
    ram_sp_async_read DUT(
        .clk(clk),
        .write_en(write_en),
        .addr(addr),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    task write_data(input [7:0] d_in, input [3:0] address);
        begin
            @(posedge clk);
            write_en = 1;
            addr = address;
            data_in = d_in;
        end
    endtask
    
    task read_data(input [3:0] address);
        begin
            addr = address;
            #0.1; // wait for input to settle
        end
    endtask
    
    task compare_data(input [3:0] address, input [7:0] expected_data, input [7:0] observed_data);
        begin
            if (expected_data == observed_data)
                begin
                    $display("SUCCESS address = %0d, expected_data = %02x, observed_data = %02x", address, expected_data, observed_data);
                    success_count = success_count + 1;
                end
            else 
                begin
                    $display("ERROR address = %0d, expected_data = %02x, observed_data = %02x", address, expected_data, observed_data);
                    error_count = error_count + 1;
                end
            test_count = test_count + 1;
        end
    endtask
    
    always begin
        #0.5;
        clk = ~clk;
    end 
    
    always @(posedge clk) begin
        $display("%0t clk rising we=%b addr=%0d din=%02x dout=%02x", $time, write_en, addr, data_in, data_out);
    end
    
    initial begin
        write_en = 0;
        addr = 0;
        data_in = 0;
        #1;
        
        for (i = 0; i < 16; i = i + 1) begin
            wr_data = $random;
            write_data(wr_data, i);
            read_data(i);
            compare_data(i, wr_data, data_out);
            delay = $random;
            #(delay);
        end
        
        read_data(7);
        read_data(8);
        
        $display("Test count: %0d, Success count: %0d, Error count: %0d", test_count, success_count, error_count);
        #40;
        $finish;
    end 
    
endmodule