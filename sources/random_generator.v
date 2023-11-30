`timescale 1ns / 1ps

// LFSR: Linear Feedback Shift Register
// Source: https://simplefpga.blogspot.com/2013/02/random-number-generator-in-verilog-fpga.html

module random_generator(
    input clk,
    input rst,
    output reg [19:0] random_number
    );
   
    reg[19:0] rnd;
    reg[4:0] count;
    wire feedback = rnd[19] ^ rnd[16];
    initial begin
        rnd <= 20'b1;
        count <= 0;
    end
   
    always@(posedge clk) begin
        if (count == 20) begin
            count <= 0;
            random_number = rnd;
        end else begin
            rnd <= {rnd[19:0], feedback};
            count <= count + 1;
        end  
    end
   
endmodule