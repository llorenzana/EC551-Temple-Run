module writer_tester (
    input wire logic clk,

    output logic [19:0] fb_addr,
    output logic hit,
    output logic [7:0] bri,
    output logic swap,
    output logic valid,

    input wire logic go
);

    logic [5:0] counter = '0;

    always_ff @(posedge clk) begin
        counter <= counter + 6'd1;
    end

    logic started = '0;

    assign valid = started && (counter == 0);
    assign hit = '1;
    assign bri = flag ? 8'h33 : 8'h44;
    assign swap = (fb_addr == 20'(600 * 600 - 1));

    logic [9:0] flag = 'd0;

    always_ff @(posedge clk) begin
        if (go) begin
            started <= '1;
        end

        if (valid) begin
            fb_addr <= (fb_addr == 20'(600 * 600 - 1)) ? 'd0 : (fb_addr + 'd1);
            if (fb_addr == 20'(600 * 600 - 1)) begin
                flag <= ~ flag;
                started <= '0;
            end
        end
    end
endmodule
