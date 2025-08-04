`timescale 1ns / 1ps

module shift_reg_piso(
    input sdi, clk, reset_n, pl,
    input [3:0] d,
    output reg sdo
    );
    
    reg [3:0] q;
    wire [3:0] data_src;
    
    assign data_src = pl? d: {sdi, q[3:1]};
    
    always @(posedge clk, negedge reset_n) begin
        if (!reset_n) begin
            q[3:0] = 4'b0000;
        end
        else begin
            q <= data_src;
        end
    end
    
    assign sdo = data_src[3]
    
endmodule
