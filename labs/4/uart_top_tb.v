`timescale 1ns / 1ps

module uart_top_tb ();

    reg clk = 0;
    wire rx_data;
    reg [7:0] test_data;

    uart_top DUT (
        .CLK(clk),
        .TXD(rx_data)
    );

    always #10 clk = ~clk;

    initial begin
        wait (~DUT.uart_tx.idle);
        while (DUT.uart_tx.bit_num != 4'hF) begin
            if (DUT.uart_tx.bit_start) begin
                test_data[DUT.uart_tx.bit_num-1] = rx_data;
            end
            #20;
        end
        if (test_data == DUT.uart_tx.data) begin
            $display("Success!");
        end else begin
            $display("Error!");
        end
        $stop;
    end

endmodule
