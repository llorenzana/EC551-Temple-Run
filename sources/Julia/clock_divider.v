`timescale 1ns / 1ps

module clock_divider(
    input clk_in,
    output reg clk_out
    );

    parameter [27:0] max = 28'd100000000; // 1 Hz
    reg [27:0] count = 0;
    always@(posedge clk_in) begin
        count = (count == max) ? 0 : count + 1;
        clk_out = (count < max/2) ? 0 : 1;
    end
   
endmodule