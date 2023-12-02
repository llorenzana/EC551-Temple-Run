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
  logic [11:0] coffset[1:0][2:0];
  logic [11:0] toffset[1:0][1:0];
  logic [11:0] roffset[1:0][1:0];
  logic [3:0] aactive;
  logic [1:0] player_lane;
 
  /* verilator lint_off UNUSEDSIGNAL */
  logic coinfli;
  /* verilator lint_off UNUSEDSIGNAL */

  initial begin
    state = RESET;
  end

  always_ff @(posedge VGA_VS) begin

    if (BTNL) begin
      offsetv <= -100;
      player_lane <= 0;
    end else if (BTNR) begin
      offsetv <= 100;
      player_lane <= 2;
    end else begin
      offsetv <= 0;
      player_lane <= 1;
    end

    case (state)
      RESET: begin
        countdown <= 5;
        offset    <= 0;
        offseth   <= 180;
        offsetv   <= 0;
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
        coinfli <= random[0];
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

  logic despawn_coin[2:0];

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
      .en(random[0] & random[1] & random[2] & (state == PLY_0)),
      .despawn(despawn_coin[0]),
      .hoffset(coffset[0][0]),
      .voffset(coffset[1][0]),
      .active()
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
      .en(random[3] & random[4] & random[5] & (state == PLY_0)),
      .despawn(despawn_coin[1]),
      .hoffset(coffset[0][1]),
      .voffset(coffset[1][1]),
      .active()
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
      .en(random[6] & random[7] & random[8] & (state == PLY_0)),
      .despawn(despawn_coin[2]),
      .hoffset(coffset[0][2]),
      .voffset(coffset[1][2]),
      .active()
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd0),
      .VSRC  (-12'd300),
      .HDST  (12'd100),
      .VDST  (12'd400),
      .STEP  (32)
  ) spawn_tree_right (
      .clk(VGA_VS),
      .en((random % 10 == 0) & (state == PLY_0) & (aactive == '0)),
      .despawn(0),
      .hoffset(toffset[0][0]),
      .voffset(toffset[1][0]),
      .active(aactive[0])
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd0),
      .VSRC  (-12'd300),
      .HDST  (-12'd100),
      .VDST  (12'd400),
      .STEP  (32)
  ) spawn_tree_left (
      .clk(VGA_VS),
      .en((random % 10 == 1) & (state == PLY_0) & (aactive == '0)),
      .despawn(0),
      .hoffset(toffset[0][1]),
      .voffset(toffset[1][1]),
      .active(aactive[1])
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd0),
      .VSRC  (-12'd300),
      .HDST  (-12'd100),
      .VDST  (12'd350),
      .STEP  (32)
  ) spawn_rock_right(
      .clk(VGA_VS),
      .en((random % 10 == 2) & (state == PLY_0) & (aactive == '0)),
      .despawn(0),
      .hoffset(roffset[0][0]),
      .voffset(roffset[1][0]),
      .active(aactive[2])
  );

  spawn #(
      .HWIDTH(12),
      .VWIDTH(12),
      .HSRC  (12'd0),
      .VSRC  (-12'd300),
      .HDST  (12'd100),
      .VDST  (12'd350),
      .STEP  (32)
  ) spawn_rock_left (
      .clk(VGA_VS),
      .en((random % 10 == 3) & (state == PLY_0) & (aactive == '0)),
      .despawn(0),
      .hoffset(roffset[0][1]),
      .voffset(roffset[1][1]),
      .active(aactive[3])
  );

  logic [12:0] bus[4:0];

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
      .INIT("tree.mem"),
      .REPLICAS(2)
  ) tree (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset(toffset[0]),
      .voffset(toffset[1]),
      .hflip({0, 1}),
      .vflip({0, 0}),
      .prev(bus[1]),
      .next(bus[2])
  );

  layer #(
      .INIT("rock.mem"),
      .REPLICAS(2)
  ) rock (
      .clk(CLK100MHZ),
      .hdata(hdata),
      .vdata(vdata),
      .hoffset(roffset[0]),
      .voffset(roffset[1]),
      .hflip({0, 1}),
      .vflip({0, 0}),
      .prev(bus[2]),
      .next(bus[3])
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
      .prev(bus[3]),
      .next(bus[4])
  );

  layer #(
      .INIT("coin.mem"),
      .REPLICAS(3)
  ) coin (
      .clk    (CLK100MHZ),
      .hdata  (hdata),
      .vdata  (vdata),
      .hoffset(coffset[0]),
      .voffset(coffset[1]),
      .hflip  ({coinfli, coinfli, coinfli}),
      .vflip  ({0, 0, 0}),
      .prev   (bus[4]),
      .next   ({VGA_R, VGA_G, VGA_B, 1'b0})
  );


    logic [31:0] coin_collision[2:0];
    logic [32:0] score;
    assign score = (state == PLY_0) ? coin_collision[0] + coin_collision[1] + coin_collision[2] : 0;
    
    initial begin
        score = 0;
    end
    always@(score) begin
        $display("Score: %d", score);
    end
 
	collision #(
        .POS_MISMATCH(70)
    )detect_left_coin_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(coffset[0][0]),
        .obst_voffset(coffset[1][0]),
        .obst_lane({0}),
        .count(coin_collision[0]),
        .despawn(despawn_coin[0])
    );
  
	collision #(
        .POS_MISMATCH(70)
    ) detect_middle_coin_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(coffset[0][1]),
        .obst_voffset(coffset[1][1]),
        .obst_lane({1}),
        .count(coin_collision[1]),
        .despawn(despawn_coin[1])
    );
	collision #(
        .POS_MISMATCH(70)
    ) detect_right_coin_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(coffset[0][2]),
        .obst_voffset(coffset[1][2]),
        .obst_lane({2}),
        .count(coin_collision[2]),
        .despawn(despawn_coin[2])
    );

    logic [2:0] fatal_collision[3:0];
    logic isDead;
    initial begin
        isDead = 0;
    end
    
    always@(fatal_collision) begin
        if (state == PLY_0) begin
            isDead <= 1;
            $display("GAME OVER!");
        end else begin
            isDead <= 0;
        end
    end

	collision #(
        .OBST_LANE(2),
        .COUNT_WIDTH(3)
    ) detect_right_tree_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(toffset[0][0]),
        .obst_voffset(toffset[1][0]),
        .obst_lane({1,2}),
        .count(fatal_collision[0]),
        .despawn()
    );
	collision #(
        .OBST_LANE(2),
        .COUNT_WIDTH(3)
    ) detect_left_tree_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(toffset[0][1]),
        .obst_voffset(toffset[1][1]),
        .obst_lane({0,1}),
        .count(fatal_collision[1]),
        .despawn()
    );

	collision #(
        .COUNT_WIDTH(3)
    ) detect_right_rock_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(roffset[0][1]),
        .obst_voffset(roffset[1][1]),
        .obst_lane({2}),
        .count(fatal_collision[2]),
        .despawn()
    );

	collision #(
        .COUNT_WIDTH(3)
    ) detect_left_rock_collision (
        .clk(VGA_VS),
        .player_hoffset(offsetv),
        .player_voffset(offseth),
        .player_lane(player_lane),
        .obst_hoffset(roffset[0][0]),
        .obst_voffset(roffset[1][0]),
        .obst_lane({0}),
        .count(fatal_collision[3]),
        .despawn()
    );
endmodule
