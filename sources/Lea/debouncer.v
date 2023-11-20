`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2023 09:19:58 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer(
    output reg clean,
    input button,
    input clk
    );
    
    reg [15:0] deb_count;
    //reg deb_count;
    reg out_exist;
    
    always @(posedge clk) begin
        if(button == 1'b0) begin
            clean <= 1'b0;
            deb_count <= 16'b0000000000000000;
            //deb_count <= 1'b0;
            out_exist <= 1'b0;
        end else begin
            if(out_exist == 1'b1) begin
                clean <= 1'b0;
            end else begin
                if(deb_count == 16'b1111111111111111) begin
                //if(deb_count == 1'b1) begin
                    clean <= 1'b1;
                    deb_count <= 16'b0000000000000000;
                    //deb_count <= 1'b0;
                    out_exist <= 1'b1;
                end else begin
                    deb_count <= deb_count + 1'b1;
                end
            end
        end   
    end
    
endmodule
