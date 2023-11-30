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

  typedef enum {
    RESET,
    PRE_0,
    PRE_1,
    PRE_2,
    PRE_3,
    PLY_0
  } STATE;

  logic [31:0] counter;
  logic [11:0] hdata, vdata;
  /* verilator lint_off UNUSEDSIGNAL */
  logic [19:0] random;
  /* verilator lint_on UNUSEDSIGNAL */

  STATE state;

  logic [11:0] countdown, offset, offseth, offsetv;
  logic [11:0] coffset[2:0][1:0];
  logic signed [11:0] coinloc;
  logic coinfli;

  initial begin
    state = RESET;
  end

  always_ff @(posedge VGA_VS) begin

    if (BTNL) begin
      offsetv <= -100;
    end else if (BTNR) begin
      offsetv <= 100;
    end else begin
      offsetv <= 0;
    end

    case (state)
      RESET: begin
        countdown <= 5;
        offset    <= 0;
        offseth   <= 180;
        offsetv   <= 0;
        coinloc   <= -50;
        coinfli   <= 0;
        state     <= PRE_0;
      end
      PRE_0: begin
        // count down
        if (countdown > 0) begin
          countdown <= countdown - 1;
        end else begin
          state <= PRE_1;
        end
      end
      PRE_1: begin
        // logo fade-out
        if (offset < 640) begin
          offset <= offset + 30;
        end else begin
          state <= PRE_2;
        end
      end
      PRE_2: begin
        // player fade-in
        if (offseth > 50) begin
          offseth <= offseth - 20;
        end else begin
          state <= PLY_0;
        end
      end
      PLY_0: begin
        // normal game play
        if (coinloc < 0) begin
          coinloc <= 0;
        end else begin
          coinloc <= coinloc + 1;
          coinfli <= random[0];
        end
      end
      default: begin
        state <= RESET;
      end
    endcase

    if (!CPU_RESETN) begin
      state <= RESET;
    end

  end

  always_ff @(posedge CLK100MHZ) begin
    counter <= counter + 1;
  end

  vga vga_i (
      .clk  (counter[1]),
      .hsync(VGA_HS),
      .vsync(VGA_VS),
      .hdata(hdata),
      .vdata(vdata),
      .valid()
  );

  random_generator rng (
      .clk(CLK100MHZ),
      .rst(~CPU_RESETN),
      .random_number(random)
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (-12'd80),
      .VSRC  (-12'd140),
      .HDST  (-12'd120),
      .VDST  (12'd220),
      .STEP  (32)
  ) spawn_coin_left (
      .clk(VGA_VS),
      .en(random[0] & random[1] & random[2] & state == PLY_0),
      .hoffset(coffset[0][0]),
      .voffset(coffset[0][1])
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd0),
      .VSRC  (-12'd140),
      .HDST  (12'd0),
      .VDST  (12'd220),
      .STEP  (32)
  ) spawn_coin_middle (
      .clk(VGA_VS),
      .en(random[3] & random[4] & random[5] & state == PLY_0),
      .hoffset(coffset[1][0]),
      .voffset(coffset[1][1])
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd80),
      .VSRC  (-12'd140),
      .HDST  (12'd120),
      .VDST  (12'd220),
      .STEP  (32)
  ) spawn_coin_right (
      .clk(VGA_VS),
      .en(random[6] & random[7] & random[8] & state == PLY_0),
      .hoffset(coffset[2][0]),
      .voffset(coffset[2][1])
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
      .clk    (CLK100MHZ),
      .hdata  (hdata),
      .vdata  (vdata),
      .hoffset({coffset[0][0], coffset[1][0], coffset[2][0]}),
      .voffset({coffset[0][1], coffset[1][1], coffset[2][1]}),
      .hflip  ({coinfli, coinfli, coinfli}),
      .vflip  ({0, 0, 0}),
      .prev   (bus[2]),
      .next   ({VGA_R, VGA_G, VGA_B, 1'b0})
  );

endmodule
