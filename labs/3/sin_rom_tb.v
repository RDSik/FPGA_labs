`timescale 1ns / 1ps

module sin_rom_tb ();

    localparam integer ROM_DEPTH = 256;
    localparam integer ROM_WIDTH = 12;

    reg clk = 0;
    reg [$clog2(ROM_DEPTH)-1:0] swt;
    wire [ROM_WIDTH-1:0] led;
    integer i;

    always #10 clk = ~clk;

    sin_rom #(
        .ROM_DEPTH(ROM_DEPTH),
        .ROM_WIDTH(ROM_WIDTH)
    ) DUT (
        .clk     (clk),
        .ROM_addr(swt),
        .ROM_data(led)
    );

    initial begin
        for (i = 0; i < ROM_DEPTH; i = i + 1) begin
            swt = i;
            #20;
        end
        $stop;
    end

endmodule
