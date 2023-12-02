`timescale 1ns / 1ps

module jump #(
    parameter integer WIDTH = 12,
    parameter GROUND = WIDTH'(40),
    parameter TOP = WIDTH'(70)
) (
    input logic clk,
    input logic up,
    input logic [WIDTH-1:0] pos,
    output logic [WIDTH-1:0] next_pos);

    typedef enum {
        NO_JUMP,
        UP,
        DOWN
    } STATE;

    STATE state;
    initial begin
        state = NO_JUMP;
    end
 
    always@(posedge clk) begin
        case (state)
            NO_JUMP: begin
                next_pos <= GROUND;
                if (up == 1) begin
                    state <= UP;
                end
            end
            UP: begin
                next_pos <= pos - 25;
                if (next_pos > TOP) begin
                    state <= DOWN;
                end
            end
            DOWN: begin
                next_pos <= pos + 40;
                if (next_pos <= GROUND) begin
                    state <= NO_JUMP;
                end
            end
            default: begin
                state <= NO_JUMP;
            end
        endcase

    end
endmodule


