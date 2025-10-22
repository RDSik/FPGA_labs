module uart_top (
    input  wire CLK,
    output wire TXD
);

    wire [2:0] addr_rom;
    wire [7:0] uart_data;

    rom rom (
        .addr(addr_rom),
        .clk (CLK),
        .q   (uart_data)
    );

    uart_tx uart_tx (
        .clk     (CLK),
        .data    (uart_data),
        .q       (TXD),
        .addr_rom(addr_rom)
    );

endmodule
