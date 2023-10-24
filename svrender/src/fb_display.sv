module fb_display (
    input wire logic clk,

    input wire logic [11:0] hdata,
    input wire logic [11:0] vdata,

    output logic [7:0] r,
    output logic [7:0] g,
    output logic [7:0] b,

    output logic sram_read,
    output logic [18:0] sram_addr,
    input wire logic [31:0] sram_data,
    output logic last_pixel
);

    logic [19:0] counter = '0;
    logic in_range;

    assign in_range = (hdata >= 'd100 && hdata < 'd700) && (vdata < 'd600);
    assign last_pixel = hdata == 'd699 && vdata == 'd599;

    logic in_range_d1;
    logic in_range_d2;
    logic sram_read_d1;
    logic sram_read_d2;

    always_ff @(posedge clk) begin
        { in_range_d2, in_range_d1 } <= { in_range_d1, in_range };
        { sram_read_d2, sram_read_d1 } <= { sram_read_d1, sram_read };
    end

    always_ff @(posedge clk) begin
        if (last_pixel) begin
            counter <= '0;
        end else if (in_range) begin
            counter <= counter + 'd1;
        end
    end

    assign sram_read = in_range && ~ counter[0];
    assign sram_addr = counter[19:1];

    logic [15:0] saved_sram_data;

    always_ff @(posedge clk) begin
        saved_sram_data <= sram_data[31:16];
    end

    /* verilator lint_off UNUSED */
    logic [15:0] cur_data;
    /* verilator lint_on UNUSED */

    always_comb begin
        if (sram_read_d2) begin
            cur_data = sram_data[15:0];
        end else begin
            cur_data = saved_sram_data;
        end
    end

    always_comb begin
        if (in_range_d2 && cur_data[8]) begin
            r = cur_data[7:0];
            g = cur_data[7:0];
            b = cur_data[7:0];
        end else begin
            r = '0;
            g = 8'd100 + (hdata >> 'd3);
            b = '0;
        end
    end
endmodule
