`timescale 1ns / 1ps

module encoder_8_3(
    input  wire [7:0] d,
    input  wire       enable,
    output reg  [2:0] y
);

  always @(*) begin
    if (!enable) begin
      y = 3'b000;                  // disabled
    end else begin
      case (d)
        8'b0000_0001: y = 3'd0;    // d[0]
        8'b0000_0010: y = 3'd1;    // d[1]
        8'b0000_0100: y = 3'd2;    // d[2]
        8'b0000_1000: y = 3'd3;    // d[3]
        8'b0001_0000: y = 3'd4;    // d[4]
        8'b0010_0000: y = 3'd5;    // d[5]
        8'b0100_0000: y = 3'd6;    // d[6]
        8'b1000_0000: y = 3'd7;    // d[7]
        default:      y = 3'b000;  // none or multiple bits set
      endcase
    end
  end

endmodule
