module sin_rom #(
    parameter integer ROM_DEPTH = 256,
    parameter integer ROM_WIDTH = 12
) (
    input  wire                         clk,
    input  wire [$clog2(ROM_DEPTH)-1:0] ROM_addr,
    output reg  [        ROM_WIDTH-1:0] ROM_data
);

    reg [ROM_WIDTH-1:0] ROM[ROM_DEPTH-1:0];

    initial begin
        $readmemb("sin_val.dat", ROM);
    end

    always @(posedge clk) begin
        ROM_data <= ROM[ROM_addr];
    end

endmodule
