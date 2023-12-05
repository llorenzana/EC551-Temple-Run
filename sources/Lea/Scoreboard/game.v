`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 09:09:22 PM
// Design Name: 
// Module Name: game
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module game(
    input clk,
    input rst,
    input coin, 
    input obst,
    input gameStart,
    input ACL_MISO,             // master in  
    output [6:0] seg, 
    output [7:0] an,
    output ACL_MOSI,            // master out
    output ACL_SCLK,            // spi sclk
    output ACL_CSN,             // spi ~chip select
    output [4:0] LED
    );
    
    parameter 
        RESET = 3'b000,
        NORM  = 3'b001,
        COIN  = 3'b010,
        OBST  = 3'b011,
        GAMEOVER = 3'b100;
    
    //define state registers 
    reg [2:0] next_state, state, cur_state, prev_state;  
    
    reg gameover; 
    reg [13:0] upCount;
    wire newclk;
    wire addCoin, hitObst, start, rstButton;
    reg [1:0] obstCount;

    
    //clk divider
    clk_divider cdiv(.clk_in(clk), 
                     .rst(rst), 
                     .divided_clk(newclk)); 
    //SSD Scoreboard                 
    scoreboard sc(.clk(clk),
                   .gameover(gameover),
                  .binary(upCount[13:0]), 
                  .anode(an[7:0]), 
                  .cathode(seg[6:0]));
    
    //Character Movement acceleromter              
    characterMovement cm(.clk(clk), 
                         .ACL_MISO(ACL_MISO),             
                         .ACL_MOSI(ACL_MOSI),            // master out
                         .ACL_SCLK(ACL_SCLK),            // spi sclk
                         .ACL_CSN(ACL_CSN),             // spi ~chip select
                         .LED(LED[4:0]));
                         
    //button push for different cases
    debouncer debCOIN(.clean(addCoin), .button(coin), .clk(clk));
    debouncer debStart_con(.clean(hitObst), .button(obst), .clk(clk));
    debouncer debstart(.clean(start), .button(gameStart), .clk(clk));
     
    always@(posedge newclk, negedge rst)
        state <= (!rst) ? RESET : next_state;
         
     
    always@(posedge newclk)begin 
        case(state)
            RESET: begin 
                upCount <=  14'b0;
                obstCount <= 2'b0; 
                gameover <= 1'b0;
            end
            
            COIN:  
                    upCount <=  upCount + 4'b1111;

            
            OBST: begin 
                    upCount <=  upCount - 4'b1111;
                    if (obstCount == 2'b11)
                        state = GAMEOVER; 
                    else obstCount <= obstCount + 1'b1;
                    
            end
            
            GAMEOVER: begin  
                upCount <= 14'b0; 
                gameover <= 1'b1;
            end 
            default:  //NORMAL
                    upCount <= upCount + 3'b101; 
        endcase 
    end
    
   
    //case based on button push       
    always@(posedge start, posedge hitObst, posedge addCoin)begin
            if (start)
                next_state <= NORM;   
            else if(rst && addCoin)   
                next_state <= COIN; //add 10 points
            else if (rst && hitObst) begin  
                if(obstCount == 2'b11)
                    next_state <= GAMEOVER;
                else next_state <= OBST; 
            end else
                next_state <= NORM;   
    end
endmodule

