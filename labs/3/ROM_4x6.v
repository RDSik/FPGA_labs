module ROM_4x6 (
    input  wire       clk,
    input  wire [1:0] ROM_addr,
    output reg  [5:0] ROM_data
);

    reg [5:0] ROM[3:0];

    initial begin
        $readmemb("ROM_4x6_data.dat", ROM, 0, 3);
    end

    always @(posedge clk) begin
        ROM_data <= ROM[ROM_addr];
    end

endmodule
