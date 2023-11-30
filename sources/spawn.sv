`timescale 1ns / 1ps

module spawn #(
    parameter HWIDTH,
              VWIDTH,
              logic signed [HWIDTH - 1:0] HSRC,
              logic signed [VWIDTH - 1:0] VSRC,
              logic signed [HWIDTH - 1:0] HDST,
              logic signed [VWIDTH - 1:0] VDST,
              STEP
) (
    input  logic                clk,
    input  logic                en,
    output logic signed [HWIDTH - 1:0] hoffset,
    output logic signed [VWIDTH - 1:0] voffset
);

  typedef enum {
    RESET,
    SPAWN
  } STATE;

  STATE   state;
  integer step;

  initial begin
    state = RESET;
  end

  always_ff @(posedge clk) begin
    case (state)
      RESET: begin
        hoffset <= HSRC;
        voffset <= VSRC;
        step <= 0;
        if (en) begin
          state <= SPAWN;
        end
      end
      SPAWN: begin
        hoffset <= hoffset + (signed'(HDST - HSRC) >>> $clog2(STEP));
        voffset <= voffset + (signed'(VDST - VSRC) >>> $clog2(STEP));
        step <= step + 1;
        if (step > 32'(STEP)) begin
          state <= RESET;
        end
      end
      default: begin
        state <= RESET;
      end
    endcase
  end

endmodule
