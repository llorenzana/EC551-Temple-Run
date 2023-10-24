module debounce #(
    parameter integer DATA_W = 4;
    parameter integer COUNTER_MAX = 200_000
) (
    input wire logic clk,

    input wire logic [DATA_W - 1 : 0] i,
    output logic [DATA_W - 1 : 0] o
);
    localparam integer COUNTER_W = $clog2(COUNTER_MAX);

    logic [DATA_W - 1 : 0] i1;
    logic [DATA_W - 1 : 0] i2;
    logic [DATA_W - 1 : 0] i3;

    always_ff @(posedge clk) begin
        { i3, i2, i1 } <= { i2, i1, i };
    end

    logic [DATA_W - 1 : 0] ev;
    assign ev = (~i3) & i2;

    logic [COUNTER_W - 1 : 0] counter = '0;

    always_ff @(posedge clk) begin
        if (| ev) begin
            counter <= COUNTER_W'(COUNTER_MAX);
        end else if (counter > 0) begin
            counter <= counter - 'd1;
        end
    end

    assign o = {DATA_W{counter == 'd1}} & i3;
endmodule
