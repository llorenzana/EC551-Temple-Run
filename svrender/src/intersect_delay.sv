module intersect_delay #(
    parameter integer DATA_W = 27
) (
    input wire logic clk,

    input wire logic signed [DATA_W - 1 : 0] i [2:0],
    output logic signed [DATA_W - 1 : 0] o [2:0]
);
    localparam integer DELAY = 3;

    logic [DATA_W - 1 :0] sr [DELAY : 0] [2:0];

    assign sr[0] = i;

    always_ff @(posedge clk) begin
        sr[DELAY : 1] <= sr[DELAY - 1 : 0];
    end

    assign o = sr[DELAY];
endmodule
