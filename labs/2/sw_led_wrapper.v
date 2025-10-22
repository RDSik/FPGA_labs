module sw_led_wrapper (
    input  wire [7:0] sw,
    output wire [4:0] led
);

    top sw_led (
        .in (sw),
        .out(led)
    );

endmodule
