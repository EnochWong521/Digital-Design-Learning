// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Sun Aug 17 15:32:52 2025
// Host        : Enoch_Laptop running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               C:/Users/Enoch/Git/Digital-Design-Learning/ram_single_port_sync_read/ram_single_port_sync_read.sim/sim_1/synth/func/xsim/ram_sp_sync_read_func_synth.v
// Design      : ram_sp_sync_read
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* NotValidForBitStream *)
module ram_sp_sync_read
   (clk,
    write_en,
    data_in,
    address,
    data_out);
  input clk;
  input write_en;
  input [7:0]data_in;
  input [3:0]address;
  output [7:0]data_out;

  wire [3:0]address;
  wire [3:0]address_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]data_out;
  wire [3:0]data_out_OBUF;

  IBUF \address_IBUF[0]_inst 
       (.I(address[0]),
        .O(address_IBUF[0]));
  IBUF \address_IBUF[1]_inst 
       (.I(address[1]),
        .O(address_IBUF[1]));
  IBUF \address_IBUF[2]_inst 
       (.I(address[2]),
        .O(address_IBUF[2]));
  IBUF \address_IBUF[3]_inst 
       (.I(address[3]),
        .O(address_IBUF[3]));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  OBUF \data_out_OBUF[0]_inst 
       (.I(data_out_OBUF[0]),
        .O(data_out[0]));
  OBUF \data_out_OBUF[1]_inst 
       (.I(data_out_OBUF[1]),
        .O(data_out[1]));
  OBUF \data_out_OBUF[2]_inst 
       (.I(data_out_OBUF[2]),
        .O(data_out[2]));
  OBUF \data_out_OBUF[3]_inst 
       (.I(data_out_OBUF[3]),
        .O(data_out[3]));
  OBUF \data_out_OBUF[4]_inst 
       (.I(1'b0),
        .O(data_out[4]));
  OBUF \data_out_OBUF[5]_inst 
       (.I(1'b0),
        .O(data_out[5]));
  OBUF \data_out_OBUF[6]_inst 
       (.I(1'b0),
        .O(data_out[6]));
  OBUF \data_out_OBUF[7]_inst 
       (.I(1'b0),
        .O(data_out[7]));
  FDRE #(
    .INIT(1'b0)) 
    \read_addr_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(address_IBUF[0]),
        .Q(data_out_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_addr_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(address_IBUF[1]),
        .Q(data_out_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_addr_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(address_IBUF[2]),
        .Q(data_out_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \read_addr_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(1'b1),
        .D(address_IBUF[3]),
        .Q(data_out_OBUF[3]),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
