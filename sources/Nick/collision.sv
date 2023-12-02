`timescale 1ns / 1ps

module collision #(
	parameter integer HWIDTH = 12,
              integer VWIDTH = 12,
              integer LWIDTH = 2,
              integer COUNT_WIDTH = 32
) (
    input logic clk,
    input logic signed [HWIDTH - 1:0] player_hoffset,
    input logic signed [VWIDTH - 1:0] player_voffset,
    input logic [LWIDTH - 1: 0] player_lane,
    input logic signed [HWIDTH - 1:0] obst_hoffset,
    input logic signed [VWIDTH - 1:0] obst_voffset,
    input logic [LWIDTH - 1:0] obst_lane,
    output logic [COUNT_WIDTH - 1:0] count
);
    initial begin
        count = 0;
    end

    always_ff @(posedge clk) begin
        if (obst_lane == player_lane && obst_voffset <= (player_voffset + 5) && obst_voffset >= (player_voffset - 5)) begin
            count <= count + 1;
            //$display("HERE!! %d %d", obst_voffset, player_voffset);
        end
    end


endmodule
