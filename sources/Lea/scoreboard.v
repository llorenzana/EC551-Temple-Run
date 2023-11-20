`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 09:08:30 PM
// Design Name: 
// Module Name: scoreboard
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


module scoreboard(
    input clk,
    input gameover,
    input [13:0] binary,
    output wire [7:0] anode,
    output wire [6:0] cathode
    );
    
    wire refresh_clock; 
    wire [2:0] refreshcounter; 
    wire [3:0] ONEDIGIT; 
    wire [16:0] outbcd; 
    wire [3:0] digit4 = 4'b1010;
    wire [3:0] digit5 = 4'b1011; 
    wire [3:0] digit6 = 4'b1100;
    wire [3:0] digit7 = 4'b1101;
    
    //clk and counter for loop
    clkSSD cdiv(.clk_in(clk), .divided_clk(refresh_clock)); 
    
    refreshcounter rf1(.refresh_clock(refresh_clock),
                       .refreshcounter(refreshcounter)) ; 
    
    ///BCD controller for scoreboard
    anode_control anCntrl(.refreshcounter(refreshcounter),
                          .an(anode));

     //convert to score board
    fifteen_BCD bcdCount(binary,
                          outbcd);    
    //which digit 
    BCD_control bcd(.digit0({1'b0, outbcd[3:0]}), 
                     .digit1({1'b0, outbcd[7:4]}), 
                     .digit2({1'b0, outbcd[11:8]}),
                     .digit3({1'b0, outbcd[15:12]}),
                     .digit4({1'b0, digit7} ),
                     .digit5({1'b0, digit6}),
                     .digit6({1'b0,digit5}),
                     .digit7({1'b0,digit4}),
                     .refreshcounter(refreshcounter),
                     .ONEDIGIT(ONEDIGIT)
                    );
    
    //display   
    BCD_to_cathodes bcdCat(.bcd(ONEDIGIT),
                          .seg(cathode));
        
          
                        
endmodule
