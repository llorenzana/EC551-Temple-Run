`timescale 1ns / 1ps

module collision #(
	parameter integer HWIDTH = 12, // height
              integer VWIDTH = 12, // vertical
              integer LWIDTH = 2, // lane
              integer OBST_LANE = 1, // # of lanes that obstacle takes up
              integer COUNT_WIDTH = 32,
              integer POS_MISMATCH = 0,
              integer POS_OFFSET = 5
) (
    input logic clk,
    input logic signed [HWIDTH - 1:0] player_hoffset,
    input logic signed [VWIDTH - 1:0] player_voffset,
    input logic [LWIDTH - 1: 0] player_lane,
    input logic signed [HWIDTH - 1:0] obst_hoffset,
    input logic signed [VWIDTH - 1:0] obst_voffset,
    input logic [LWIDTH - 1:0] obst_lane [OBST_LANE],
    output logic [COUNT_WIDTH - 1:0] count,
    output logic despawn
);
    initial begin
        count = 0;
        despawn = 0;
    end

    genvar i;

    generate
      for (i = 0; i < OBST_LANE; i = i + 1) begin
        always_ff @(posedge clk) begin
            if (obst_lane[i] == player_lane && 
                (obst_voffset - VWIDTH'(POS_MISMATCH)) <= (player_voffset + VWIDTH'(POS_OFFSET)) && 
                (obst_voffset - VWIDTH'(POS_MISMATCH)) >= (player_voffset - VWIDTH'(POS_OFFSET))) begin
                count <= count + 1;
                despawn <= 1;
                //$display("HERE!! %d %d", obst_voffset, player_voffset);
            end else begin
                despawn <= 0;
            end
        end
      end
    endgenerate


endmodule
