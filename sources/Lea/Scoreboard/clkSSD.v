`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 09:18:53 PM
// Design Name: 
// Module Name: clkSSD
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


module clkSSD(
    input clk_in,
	output reg divided_clk
    );
	 
	 
parameter toggle_value = 17'b11000011010100000;
///parameter toggle_value = 20'b11001011011100110101;

	 
reg[16:0] cnt;

always@(posedge clk_in)
begin


		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clk <= ~divided_clk;
		end
		else begin
			cnt <= cnt +1;
			divided_clk <= divided_clk;		
		end


end

endmodule