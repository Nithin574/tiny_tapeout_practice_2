/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */
`default_nettype none

module tt_um_Nithin574 (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
wire detect_out;
  // All output pins must be assigned. If not used, assign to 0.
   // Example: ou_out is the sum of ui_in and uio_in
    assign uo_out = {7'b0000000, detect_out}; 
  assign uio_out = 0;
  assign uio_oe  = 0;

  // List all unused inputs to prevent warnings
    wire _unused = &{ena, uio_in, ui_in[7:1], 1'b0};

    melay_11011_non_overlapping fsm(clk, rst_n, ui_in[0], detect_out);

endmodule
