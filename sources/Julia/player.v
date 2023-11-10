`timescale 1ns / 1ps

module player(
    input clk,
    input rst,
    input left,
    input right,
    input jump,
    output reg [9:0] x,
    output [8:0] y
    );
    
    wire clk_1kHz;
    defparam div_1kHz.max = 28'd1000000; // changed, not 1kHz anymore; fix later
    clock_divider div_1kHz(.clk_in(clk), .clk_out(clk_1kHz));
    
    wire left_o, right_o, jump_o;
    debouncer deb0(.clk(clk), .reset(rst), .button_in(left), .button_out(left_o));
    debouncer deb1(.clk(clk), .reset(rst), .button_in(right), .button_out(right_o));
    debouncer deb2(.clk(clk), .reset(rst), .button_in(jump), .button_out(jump_o));
    
    reg [1:0] direction;
    player_jump jmp (clk_1kHz, rst, direction, y);
    
    always@(posedge clk) begin
        if (rst) begin
            x = 260;
        end else if (left_o && x != 140) begin
            x = x - 120;
        end else if (right_o && x != 380) begin
            x = x + 120;
        end else if (jump_o) begin
            direction = 1;
        end else if (y <= 310) begin
            direction = 2;
        end else if (y > 350) begin
            direction = 0;
        end
    end

endmodule

module player_jump (input clk, input rst, input [1:0] direction, output reg [8:0] y);
    initial begin
        y = 350;
    end
    
    always@(posedge clk) begin
        if (direction == 1) begin
            y <= y - 1;
        end else if (direction == 2) begin
            y <= y + 1;
        end else begin
            y <= 350;
        end
    end

endmodule
