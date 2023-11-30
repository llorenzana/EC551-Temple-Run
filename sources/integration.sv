`timescale 1ns / 1ps

module integration(
   input logic        CLK100MHZ,
   input logic       CPU_RESETN,
   input logic             BTNL,
   input logic             BTNR,
  output logic           VGA_HS,
  output logic           VGA_VS,
  output logic [3:0]      VGA_R,
  output logic [3:0]      VGA_G,
  output logic [3:0]      VGA_B
);

  logic [31:0] counter;
  logic [11:0] hdata, vdata;
  logic valid;

  logic signed [11:0] countdown, offset, offseth, offsetv;
  logic signed [11:0] coinloc;

  initial begin
    countdown =   10;
    offset    =    0;
    offseth   = -170;
    offsetv   =    0;
    coinloc   =    0;
  end

  always_ff @(posedge CLK100MHZ) begin
    counter <= counter + 1;
    if (BTNL) begin
      offsetv =  100;
    end else if (BTNR) begin
      offsetv = -100;
    end else begin
      offsetv =    0;
    end
  end

  always_ff @(posedge VGA_VS) begin
    if (countdown > 5) begin
      countdown <= countdown - 1;
    end else if (offset > -600) begin
      offset <= offset - 30;
    end else if (offseth < 0) begin
      offseth <= offseth + 17;
    end
    if (!CPU_RESETN) begin
      countdown <=    50;
         offset <=     0;
        offseth <=  -170;
    end

    coinloc <= coinloc + 1;
  end

  vga vga_i(
    .clk(counter[1]),
    .hsync(VGA_HS),
    .vsync(VGA_VS),
    .hdata(hdata),
    .vdata(vdata),
    .valid(valid)
  );

  logic [12:0] bus[2:0];

  layer #(.INIT("background.mem")) background(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset({0}),
    .voffset({0}),
    .prev(13'b0),
    .next(bus[0])
  );

  layer #(.INIT("logo.mem")) logo(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset({0}),
    .voffset({offset}),
    .prev(bus[0]),
    .next(bus[1])
  );

  layer #(.INIT("head.mem")) head(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset({offsetv}),
    .voffset({offseth}),
    .prev(bus[1]),
    .next(bus[2])
  );

  layer #(.INIT("coin.mem"), .REPLICAS(3)) coin(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    // move from
    // .hoffset(-200),
    // .voffset(-40),
    // to
    // .hoffset(-140),
    // .voffset(-400),
    .hoffset({-200 + coinloc, -280, -360 - coinloc}),
    .voffset({-40 - 6 * coinloc, -40 - 6 * coinloc, -40 - 6 * coinloc}),
    .prev(bus[2]),
    .next({VGA_R, VGA_G, VGA_B, 1'b0})
  );

endmodule
