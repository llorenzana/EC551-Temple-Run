module sram_controller (
    input wire logic clk,

    input wire logic [31:0] base_ram_data_i,
    output logic [31:0] base_ram_data_o,
    output logic base_ram_data_t,
    output logic [19:0] base_ram_addr,   // SRAM 地址
    output logic [3:0] base_ram_be_n,   // SRAM 字节使能，低有效。如果不使用字节使能，请保持为0
    output logic base_ram_ce_n,   // SRAM 片选，低有效
    output logic base_ram_oe_n,   // SRAM 读使能，低有效
    output logic base_ram_we_n,   // SRAM 写使能，低有效

    input wire logic sram_read,
    input wire logic [18:0] sram_addr,
    input wire logic last_pixel,
    output logic [31:0] sram_data,

    input wire logic [19:0] fb_addr_fifo,
    input wire logic hit_fifo,
    input wire logic [7:0] bri_fifo,
    input wire logic valid_fifo,
    input wire logic swap_fifo,
    output logic ready_fifo
);

    logic fb_side = '0;

    assign ready_fifo = (! sram_read) && valid_fifo;

    assign base_ram_ce_n = '0;

    always_ff @(posedge clk) begin
        if (sram_read) begin
            base_ram_oe_n <= '0;
            base_ram_we_n <= '1;
            base_ram_be_n <= '0;
            base_ram_addr <= { fb_side, sram_addr };
            base_ram_data_o <= 'x;
            base_ram_data_t <= '1;
        end else if (valid_fifo) begin
            base_ram_oe_n <= '1;
            base_ram_we_n <= '0;
            base_ram_be_n <= fb_addr_fifo[0] ? 4'b0011 : 4'b1100;
            base_ram_addr <= { ~ fb_side, fb_addr_fifo[19:1] };
            base_ram_data_o <= { 7'b0, hit_fifo, bri_fifo, 7'b0, hit_fifo, bri_fifo };
            base_ram_data_t <= '0;
        end else begin
            base_ram_oe_n <= '1;
            base_ram_we_n <= '1;
            base_ram_be_n <= '1;
            base_ram_addr <= '0;
            base_ram_data_o <= 'x;
            base_ram_data_t <= '1;
        end
    end

    logic next_fb_side = '0;

    always_ff @(posedge clk) begin
        if (ready_fifo && swap_fifo)
            next_fb_side <= ~ next_fb_side;
    end

    always_ff @(posedge clk) begin
        if (last_pixel)
            fb_side <= next_fb_side;
    end

    always_ff @(posedge clk) begin
        sram_data <= base_ram_data_i;
    end
endmodule
