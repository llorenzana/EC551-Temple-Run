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
    countdown =    0;
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
      offset <= offset - 300;
    end else if (offseth < 0) begin
      offseth <= offseth + 170;
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

  logic [3:0] R [5:0], G [5:0], B [5:0];
  logic                         A [5:0];

  compositor compositor_i0(
    .R_prev(R[0]),
    .G_prev(G[0]),
    .B_prev(B[0]),
    .A_prev(A[0]),
    .R_curr(R[1]),
    .G_curr(G[1]),
    .B_curr(B[1]),
    .A_curr(A[1]),
    .R_next(R[2]),
    .G_next(G[2]),
    .B_next(B[2]),
    .A_next(A[2])
  );

  compositor compositor_i1(
    .R_prev(R[2]),
    .G_prev(G[2]),
    .B_prev(B[2]),
    .A_prev(A[2]),
    .R_curr(R[3]),
    .G_curr(G[3]),
    .B_curr(B[3]),
    .A_curr(A[3]),
    .R_next(R[4]),
    .G_next(G[4]),
    .B_next(B[4]),
    .A_next(A[4])
  );

  compositor compositor_i2(
    .R_prev(R[4]),
    .G_prev(G[4]),
    .B_prev(B[4]),
    .A_prev(A[4]),
    .R_curr(R[5]),
    .G_curr(G[5]),
    .B_curr(B[5]),
    .A_curr(A[5]),
    .R_next(VGA_R),
    .G_next(VGA_G),
    .B_next(VGA_B),
    .A_next()
  );


  logic [12:0] datab, dataf, datah, datac;
  logic [14:0] addrb, addrf, addrh, addrc;
  logic validb, validf, validh, validc;

  transformer transformer_i0(
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(0),
    .voffset(0),
    .addr(addrb),
    .valid(validb)
  );

  transformer transformer_i1(
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(offset),
    .voffset(0),
    .addr(addrf),
    .valid(validf)
  );

  transformer transformer_i2(
    .hdata(hdata),
    .vdata(vdata),
    .hoffset(offsetv),
    .voffset(offseth),
    .addr(addrh),
    .valid(validh)
  );

  transformer transformer_i3(
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
    .addr(addrc),
    .valid(validc)
  );

  vram vram_i0(
    .clk(CLK100MHZ),
    .addr(addrb),
    .en(validb),
    .data(datab)
  );

  defparam vram_i0.INIT = "background.mem";

  vram vram_i1(
    .clk(CLK100MHZ),
    .addr(addrf),
    .en(validf),
    .data(dataf)
  );

  defparam vram_i1.INIT = "logo.mem";

  vram vram_i2(
    .clk(CLK100MHZ),
    .addr(addrh),
    .en(validh),
    .data(datah)
  );

  defparam vram_i2.INIT = "head.mem";

  vram vram_i3(
    .clk(CLK100MHZ),
    .addr(addrc),
    .en(validc),
    .data(datac)
  );

  defparam vram_i3.INIT = "coin.mem";

  assign R[0] = valid ? datab[12:9] : 4'b0;
  assign G[0] = valid ? datab[ 8:5] : 4'b0;
  assign B[0] = valid ? datab[ 4:1] : 4'b0;
  assign A[0] = valid ? datab[   0] : 1'b0;

  assign R[1] = valid ? dataf[12:9] : 4'b0;
  assign G[1] = valid ? dataf[ 8:5] : 4'b0;
  assign B[1] = valid ? dataf[ 4:1] : 4'b0;
  assign A[1] = valid ? dataf[   0] : 1'b0;

  assign R[3] = valid ? datah[12:9] : 4'b0;
  assign G[3] = valid ? datah[ 8:5] : 4'b0;
  assign B[3] = valid ? datah[ 4:1] : 4'b0;
  assign A[3] = valid ? datah[   0] : 1'b0;

  assign R[5] = valid ? datac[12:9] : 4'b0;
  assign G[5] = valid ? datac[ 8:5] : 4'b0;
  assign B[5] = valid ? datac[ 4:1] : 4'b0;
  assign A[5] = valid ? datac[   0] : 1'b0;

endmodule
