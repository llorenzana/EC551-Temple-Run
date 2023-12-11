`timescale 1ns / 1ps

module spawn #(
    parameter integer                     HWIDTH,
              integer                     VWIDTH,
              logic signed [HWIDTH - 1:0] HSRC,
              logic signed [VWIDTH - 1:0] VSRC,
              logic signed [HWIDTH - 1:0] HDST,
              logic signed [VWIDTH - 1:0] VDST,
              integer                     STEP
) (
    input  logic                       clk,
    input  logic                       en,
    input  logic                       despawn,
    output logic signed [HWIDTH - 1:0] hoffset,
    output logic signed [VWIDTH - 1:0] voffset,
    output logic                       active
);

  typedef enum {
    RESET,
    INITA,
    SPAWN
  } STATE;

  STATE   state;
  integer step;

  initial begin
    state = RESET;
  end

  always_comb begin
    active = (state == INITA) || (state == SPAWN);
  end

  always_ff @(posedge clk) begin
    case (state)
      RESET: begin
        hoffset <= 1000;
        voffset <= 1000;
        step <= 0;
        if (en) begin
          state <= INITA;
        end
      end
      INITA: begin
        hoffset <= HSRC;
        voffset <= VSRC;
        state   <= SPAWN;
      end
      SPAWN: begin
        hoffset <= hoffset + ((HDST - HSRC) >>> $clog2(STEP));
        voffset <= voffset + ((VDST - VSRC) >>> $clog2(STEP));
        step <= step + 1;
        if (step > STEP || despawn == 1) begin
          state <= RESET;
        end
      end
      default: begin
        state <= RESET;
      end
    endcase
  end

endmodule
