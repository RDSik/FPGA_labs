`timescale 1ns / 1ps

module top_tb ();

    reg [7:0] in_tb;
    wire [4:0] out_tb;
    integer i;

    top DUT (
        .in (in_tb),
        .out(out_tb)
    );

    initial begin
        for (i = 0; i < 256; i = i + 1) begin
            in_tb = i;
            #10;
        end
        $stop;
    end

endmodule
