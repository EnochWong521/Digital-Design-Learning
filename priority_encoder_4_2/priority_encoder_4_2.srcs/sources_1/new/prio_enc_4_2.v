`timescale 1ns /1ps

module prio_enc_4_2(
    input [3:0] d,
    output reg [1:0] q,
    output reg v
    );
    
    always @(*) begin
       if (d[3]) 
           q = 2'b11;
       else if (d[2])
           q = 2'b10;
       else if (d[1])
           q = 2'b01;
       else
           q = 2'b00;  
    end
    
    always @(*) begin
        if (!d)
            v = 1'b0;
        else 
            v = 1'b1;
    end

endmodule