`timescale 1ns / 1ps

module integration (
    input  logic       CLK100MHZ,
    input  logic       CPU_RESETN,
    input  logic       BTNL,
    input  logic       BTNR,
    output logic       VGA_HS,
    output logic       VGA_VS,
    output logic [3:0] VGA_R,
    output logic [3:0] VGA_G,
    output logic [3:0] VGA_B
);

  logic [31:0] counter;
  logic [11:0] hdata, vdata;

  logic signed [11:0] countdown, offset, offseth, offsetv;
  logic signed [11:0] coinloc;

  initial begin
    countdown =   10;
    offset    =    0;
    offseth   =  180;
    offsetv   =    0;
    coinloc   =  -50;
  end

  always_ff @(posedge CLK100MHZ) begin
    counter <= counter + 1;
    if (BTNL) begin
      offsetv <= -100;
    end else if (BTNR) begin
      offsetv <= 100;
    end else begin
      offsetv <= 0;
    end
  end

  always_ff @(posedge VGA_VS) begin
    if (countdown > 5) begin
      countdown <= countdown - 1;
    end else if (offset < 640) begin
      offset <= offset + 30;
    end else if (offseth > 50) begin
      offseth <= offseth - 17;
    end else if (coinloc < 0) begin
      coinloc <= 0;
    end else begin
      coinloc <= coinloc + 1;
    end
    if (!CPU_RESETN) begin
      countdown <= 10;
      offset    <= 0;
      offseth   <= 180;
      coinloc   <= -50;
    end
  end

  vga vga_i (
      .clk  (counter[1]),
      .hsync(VGA_HS),
      .vsync(VGA_VS),
      .hdata(hdata),
      .vdata(vdata),
      .valid()
  );

  logic [12:0] bus[2:0];

  layer #(
      .INIT("background.mem")
  ) background (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset({0}),
      .voffset({0}),
      .hflip({0}),
      .vflip({0}),
      .prev(13'b0),
      .next(bus[0])
  );

  layer #(
      .INIT("logo.mem")
  ) logo (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset({0}),
      .voffset({offset}),
      .hflip({0}),
      .vflip({0}),
      .prev(bus[0]),
      .next(bus[1])
  );

  layer #(
      .INIT("head.mem")
  ) head (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset({offsetv}),
      .voffset({offseth}),
      .hflip({0}),
      .vflip({0}),
      .prev(bus[1]),
      .next(bus[2])
  );

  layer #(
      .INIT("coin.mem"),
      .REPLICAS(3)
  ) coin (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset({-80 - coinloc, 0, 80 + coinloc}),
      .voffset({-120 + 6 * coinloc, -120 + 6 * coinloc, -120 + 6 * coinloc}),
      .hflip({0, 0, 0}),
      .vflip({0, 0, 0}),
      .prev(bus[2]),
      .next({VGA_R, VGA_G, VGA_B, 1'b0})
  );

endmodule
