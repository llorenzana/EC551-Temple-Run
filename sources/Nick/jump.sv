`timescale 1ns / 1ps

module jump #(
    parameter integer WIDTH = 12
) (
    input logic clk,
    input logic up,
    input logic [WIDTH-1:0] pos,
    output logic [WIDTH-1:0] next_pos);

    always@(posedge clk) begin
        next_pos <= pos;
        if (up == 1) begin
            $display("UP!");
        end
    end
endmodule


