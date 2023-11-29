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

  logic [3:0] R [4:0], G [4:0], B [4:0];
  logic                         A [4:0];

  layer #(.INIT("background.mem")) background(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(0),
    .voffset(0),
    .R_prev(4'b0),
    .G_prev(4'b0),
    .B_prev(4'b0),
    .A_prev(1'b0),
    .R_next(R[0]),
    .G_next(G[0]),
    .B_next(B[0]),
    .A_next(A[0])
  );

  layer #(.INIT("logo.mem")) logo(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(0),
    .voffset(offset),
    .R_prev(R[0]),
    .G_prev(G[0]),
    .B_prev(B[0]),
    .A_prev(A[0]),
    .R_next(R[1]),
    .G_next(G[1]),
    .B_next(B[1]),
    .A_next(A[1])
  );

  layer #(.INIT("head.mem")) head(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(offsetv),
    .voffset(offseth),
    .R_prev(R[1]),
    .G_prev(G[1]),
    .B_prev(B[1]),
    .A_prev(A[1]),
    .R_next(R[2]),
    .G_next(G[2]),
    .B_next(B[2]),
    .A_next(A[2])
  );

  layer #(.INIT("coin.mem")) coin_left(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    // move from
    // .hoffset(-200),
    // .voffset(-40),
    // to
    // .hoffset(-140),
    // .voffset(-400),
    .hoffset(-200 + coinloc),
    .voffset(-40 - 6 * coinloc),
    .R_prev(R[2]),
    .G_prev(G[2]),
    .B_prev(B[2]),
    .A_prev(A[2]),
    .R_next(R[3]),
    .G_next(G[3]),
    .B_next(B[3]),
    .A_next(A[3])
  );

  layer #(.INIT("coin.mem")) coin_middle(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(-280),
    .voffset(-40 - 6 * coinloc),
    .R_prev(R[3]),
    .G_prev(G[3]),
    .B_prev(B[3]),
    .A_prev(A[3]),
    .R_next(R[4]),
    .G_next(G[4]),
    .B_next(B[4]),
    .A_next(A[4])
  );

  layer #(.INIT("coin.mem")) coin_right(
    .clk(CLK100MHZ),
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(-360 - coinloc),
    .voffset(-40 - 6 * coinloc),
    .R_prev(R[4]),
    .G_prev(G[4]),
    .B_prev(B[4]),
    .A_prev(A[4]),
    .R_next(VGA_R),
    .G_next(VGA_G),
    .B_next(VGA_B),
    .A_next()
  );

endmodule
