`timescale 1ns / 1ps

module ROM_4x6_tb ();

    reg clk = 0;
    reg [1:0] swt;
    wire [5:0] led;
    integer i;

    always #10 clk = ~clk;

    ROM_4x6 DUT (
        .clk     (clk),
        .ROM_addr(swt),
        .ROM_data(led)
    );

    initial begin
        for (i = 0; i < 4; i = i + 1) begin
            swt = i;
            #20;
        end
        $stop;
    end

endmodule
