`timescale 1ns / 1ps

module background(
    input[9:0] x,
    input [8:0] y,
    output reg [3:0] R,
    output reg [3:0] G,
    output reg [3:0] B
    );
    
    always@(*) begin
        if (x >= 140 && x <= 500) begin
            R = 15;
            G = 0;
            B = 0;
        end else begin
            R = 0;
            G = 15;
            B = 5;
        end
    end
endmodule
