`timescale 1ns / 1ps

module top(
    input wire CLK,             // board clock: 100 MHz on Arty/Basys3/Nexys
    input wire RST_BTN,
    input wire jump,
    input wire left,
    input wire right,   
    output wire VGA_HS_O,       // horizontal sync output
    output wire VGA_VS_O,       // vertical sync output
    output reg [3:0] VGA_R,    // 4-bit VGA red output
    output reg [3:0] VGA_G,    // 4-bit VGA green output
    output reg [3:0] VGA_B     // 4-bit VGA blue output
    );

    wire rst = ~RST_BTN;    // reset is active low on Arty & Nexys Video
    
    // generate a 25 MHz pixel strobe
    reg [15:0] cnt;
    reg pix_stb;
    always @(posedge CLK)
        {pix_stb, cnt} <= cnt + 16'h4000;  // divide by 4: (2^16)/4 = 0x4000

    wire [9:0] x;  // current pixel x position: 10-bit value: 0-1023
    wire [8:0] y;  // current pixel y position:  9-bit value: 0-511

    vga640x480 display (
        .i_clk(CLK),
        .i_pix_stb(pix_stb),
        .i_rst(rst),
        .o_hs(VGA_HS_O), 
        .o_vs(VGA_VS_O), 
        .o_x(x), 
        .o_y(y)
    );

    wire [3:0] backgroundR, backgroundG, backgroundB;
    background graphics0(x, y, backgroundR, backgroundG, backgroundB);
        
    wire [9:0] playerX;
    wire [8:0] playerY;
    player player(CLK, rst, left, right, jump, playerX, playerY);
    
    wire clk_1Hz;
    clock_divider div_1Hz (.clk_in(CLK), .clk_out(clk_1Hz));
    wire [19:0] random_number;
    
    random_generator(CLK, rst, random_number); 
    
    wire clk_100Hz;
    defparam div_100Hz.max = 28'd1000000;
    clock_divider div_100Hz(.clk_in(CLK), .clk_out(clk_100Hz));
    
    wire [29:0] coinsX;
    wire [26:0] coinsY;
    wire [5:0] coins;
    coin graphics1(clk_1Hz, clk_100Hz, rst, random_number, coinsX, coinsY, coins); 
    
    
    always@(*) begin
        if (x > playerX & x < (playerX+120) & y  > playerY & y < (playerY + 40)) begin
            VGA_R = 15;
            VGA_G = 15;
            VGA_B = 15;
        end else if (coins[1:0] != 0 && x > coinsX[9:0] && x < (coinsX[9:0]+50)
            && y > coinsY[8:0] && y < (coinsY[8:0] + 50)) begin
            
            VGA_R = 0;
            VGA_G = 0;
            VGA_B = 15;
        end else if (coins[3:2] != 0 && x > coinsX[19:10] && x < (coinsX[19:10]+50)
            && y > coinsY[17:9] && y < (coinsY[17:9] + 50)) begin
            
            VGA_R = 0;
            VGA_G = 0;
            VGA_B = 15;
        end else if (coins[5:4] != 0 && x > coinsX[29:20] && x < (coinsX[29:20]+50)
            && y > coinsY[26:18] && y < (coinsY[26:18] + 50)) begin
            
            VGA_R = 0;
            VGA_G = 0;
            VGA_B = 15;
        end else begin
            VGA_R = backgroundR;
            VGA_G = backgroundG;
            VGA_B = backgroundB;
        end
    end
     
endmodule
