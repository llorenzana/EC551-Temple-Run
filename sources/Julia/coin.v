`timescale 1ns / 1ps

module coin(
    input clk_1Hz,
    input clk_100Hz,
    input rst,
    input [19:0] rnd,
    output reg [29:0] x,
    output wire [26:0] y,
    output reg [5:0] coins
    );
    //coins:
    // 3 coins max, each coin has 2 bits:
    // 0 not rendered, 1: lane 1, 2: lane 2, 3: lane 3
    reg [1:0] lane;
    reg [9:0] laneX;
    reg rendered;
    
    initial begin
        x = 0;
        coins = 0;
        rendered = 0;
    end
    

    always@(posedge clk_1Hz) begin
        if (coins[1:0] == 0) begin
            coins[1:0] <= lane;
            x[9:0] <= laneX;
        end else if (coins[3:2] == 0) begin
            if (y[8:0] > 480) begin
                coins[1:0] <= 0;
            end
            coins[3:2] <= lane;
            x[19:10] <= laneX;
        end else if (coins[5:4] == 0) begin
            if (y[8:0] > 480) begin
                coins[1:0] <= 0;
            end
            if (y[17:9] > 480) begin
                coins[3:2] <= 0;
            end
            coins[5:4] <= lane;
            x[29:20] <= laneX;
        end else begin
            if (y[8:0] > 480) begin
                coins[1:0] <= 0;
            end
            if (y[17:9] > 480) begin
                coins[3:2] <= 0;
            end
            if (y[26:18] > 480) begin
                coins[5:4] <= 0;
            end
        end
    end
    
    always @(*) begin
        if (rnd >= 0 && rnd < 100000) begin
            lane = 1;
            laneX = 175;
        end else if (rnd >= 100000 && rnd < 200000) begin
            lane = 2;
            laneX = 295;
        end else if (rnd >= 200000 && rnd < 300000) begin
            lane = 3;
            laneX = 415;
        end else begin
            lane = 0;
            laneX = 0;
        end
        
    end
    
    fall(clk_100Hz, coins, y);
    
endmodule

module fall(input clk, input [5:0] coins, output reg [26:0] y);
    initial begin
        y = 0;
    end

    always@(posedge clk) begin
        if (coins[1:0] != 0) begin
            y[8:0] = y[8:0] + 1;
        end else begin
            y[8:0] = 0;
        end
        
        if (coins[3:2] != 0) begin
            y[17:9] = y[17:9] + 1;
        end else begin
            y[17:9] = 0;
        end
        
        if (coins[5:4] != 0) begin
            y[26:18] = y[26:18] + 1;
        end else begin
            y[26:18] = 0;
        end
    end
endmodule