`timescale 1ns / 1ps
module debouncer(
    input clk,
    input reset,
    input button_in,
    output reg button_out
);
    reg deb_count_start;
    reg [7:0] deb_count;
    reg output_exist;
    reg [7:0] MAX = 8'b11111111;
   
    always@ (posedge clk) begin
        if (reset == 0) begin
            button_out <= 0;
        end
       
        if (button_in == 1) begin
            if (output_exist == 0) begin
                if (deb_count_start == 0) begin
                    deb_count_start <= 1;
                    deb_count <= deb_count + 1;
                end else begin
                    deb_count <= deb_count + 1;
                end // deb_count_start
               
                if (deb_count == MAX) begin
                    button_out <= 1;
                    deb_count_start <= 0;
                    deb_count <= 0;
                    output_exist <= 1;
                end // deb_count == MAX
               
            end else begin
                button_out <= 0;
            end // output_exist
        end else begin
            deb_count_start <= 0;
            deb_count <= 0;
            output_exist <= 0;
            button_out <= 0;
        end
    end // always
endmodule