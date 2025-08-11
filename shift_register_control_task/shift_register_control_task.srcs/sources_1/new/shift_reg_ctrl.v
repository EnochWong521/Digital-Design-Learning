`timescale 1ns / 1ps

module shift_reg_ctrl();
    parameter REG_WIDTH = 8;
    reg load, shift_left_right;
    reg [REG_WIDTH-1:0] data;
    reg clk = 0;
    
    // task definition
    // not synthesizable since there is time control
    task shift_register_control (input i_shift_left_right, input [REG_WIDTH-1:0] i_data);
        begin
            @(posedge clk);
            data = i_data;
            shift_left_right = i_shift_left_right;
        end
    endtask
    
    //clock
    always begin 
        #0.5;
        clk = ~clk;
    end
    
    initial begin
        // init
        load = 1'b0;
        shift_left_right = 1'b0;
        data = {REG_WIDTH{1'b0}};

        // Print whenever any listed signal changes
        $monitor("%0t ns | clk=%b load=%b dir=%b data=0x%0h",
                 $time,    clk, load,  shift_left_right, data);

        // Drive a few examples via the task
        shift_register_control(1'b0, 8'hA5); // shift right, load A5
        shift_register_control(1'b1, 8'h3C); // shift left,  load 3C
        shift_register_control(1'b0, 8'hFF); // shift right, load FF

        // Let it run a bit, then finish
        #5 $finish;
    end
endmodule
