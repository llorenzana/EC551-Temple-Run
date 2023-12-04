`timescale 1ns / 1ps

module player(
    input CLK,              // System clock
    input RST_BTN,          // Reset button
    input jump,
    input START,            // Start signal for SPI
    input SDI,              // Serial Data Input for SPI
    output SDO,             // Serial Data Output for SPI
    output SCLK,            // SPI Clock
    output SS,              // Slave Select for SPI
    output [9:0] x,         // Player's X position
    output [8:0] y          // Player's Y position
);

    wire rst = ~RST_BTN;    // Active-low reset
    wire clk_1kHz;
    defparam div_1kHz.max = 28'd1000000; // changed, not 1kHz anymore; fix later
    clock_divider div_1kHz(.clk_in(CLK), .clk_out(clk_1kHz));

    wire [9:0] yAxis;
    wire [15:0] TxBuffer;
    wire [7:0] RxBuffer;
    wire doneConfigure;
    wire done;
    wire transmit;
    wire clk_acl;
    wire vclk;
 
    ClkDiv_50MHz vgaclk(
		.CLK(clk),
		.RST(rst),
		.CLKOUT(vclk)
	);
	
    ClkDiv_5Hz acl_clk(
         .CLK(clk),
         .RST(rst),
         .CLKOUT(clk_acl)
    );
    
   // Instance of spicomponent
   spicomponent spi0(
       .CLK(CLK),
       .RST(RST),
       .START(clk_acl),
       .SDI(SDI),
       .SDO(SDO),
       .SCLK(SCLK),
       .SS(SS),
       .yAxis(yAxis)
   );
   
    characterMovement char_move( 
			 .clk(vclk), 
			 .ACL_IN(yAxis),
			 .rst(RST),
			 .win_rst(0),
			 .char_x(char_x),
			 .char_y(char_y)
		);

    wire jump_o;
    debouncer deb_jump(.clk(CLK), .reset(rst), .button_in(jump), .button_out(jump_o));

    reg [1:0] direction;
    player_jump jmp (.clk(clk_1kHz), .rst(rst), .direction(direction), .y(y));

    always @(posedge CLK) begin
        if (rst) begin
            direction = 0;  // No direction when reset
        end else if (jump_o) begin
            direction = 1;  // Upward direction for jump
        end else if (y <= 310) begin
            direction = 2;  // Downward direction after jump
        end else if (y > 350) begin
            direction = 0;  // No direction after landing
        end
    end
endmodule

module player_jump (input clk, input rst, input [1:0] direction, output reg [8:0] y);
    initial begin
        y = 350;
    end
    
    always @(posedge clk) begin
        if (rst) begin
            y <= 350; // Reset to ground position
        end else if (direction == 1) begin
            y <= y - 1; // Jumping up
        end else if (direction == 2) begin
            y <= y + 1; // Falling down
        end
    end
endmodule
