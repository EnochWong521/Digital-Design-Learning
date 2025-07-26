`timescale 1ns / 1ps

module decoder_3_8(
    input [2:0] a,
    input enable,
    output reg  [7:0] y
);

  // Whenever 'a' changes, drive 'y' one-hot
  always @(a or enable) begin
    if (enable == 0) begin
        y = 8'b0000_0000;
    end
    else begin
        case (a)
          3'b000: y = 8'b0000_0001;
          3'b001: y = 8'b0000_0010;
          3'b010: y = 8'b0000_0100;
          3'b011: y = 8'b0000_1000;
          3'b100: y = 8'b0001_0000;
          3'b101: y = 8'b0010_0000;
          3'b110: y = 8'b0100_0000;
          3'b111: y = 8'b1000_0000;
          default: y = 8'b0000_0000;  // safe fallback
        endcase
    end
  end

endmodule
