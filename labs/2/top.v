module top (
    input  wire [7:0] in,
    output wire [4:0] out
);
    wire and_to_not;

    user_and and_0 (
        .a(in[7]),
        .b(in[6]),
        .c(out[4])
    );

    user_or or_0 (
        .a(in[5]),
        .b(in[4]),
        .c(out[3])
    );

    user_not not_0 (
        .a(in[3]),
        .c(out[2])
    );

    user_and and_1 (
        .a(in[2]),
        .b(in[1]),
        .c(and_to_not)
    );

    user_not not_1 (
        .a(and_to_not),
        .c(out[1])
    );

    assign out[0] = in[0];

endmodule
