module rom (
    input  wire       clk,
    input  wire [2:0] addr,
    output reg  [7:0] q
);

    always @(posedge clk) begin
        case (addr)
            3'b000: q = 8'b01011011;  // ascii символ [
            3'b001: q = 8'b01000110;  // ascii символ F
            3'b010: q = 8'b01010000;  // ascii символ P
            3'b011: q = 8'b01000111;  // ascii символ G
            3'b100: q = 8'b01000001;  // ascii символ A
            3'b101: q = 8'b01011101;  // ascii символ ]
            3'b110: q = 8'b00001101;  // ascii символ \r
            3'b111: q = 8'b00001010;  // ascii символ \n
        endcase
    end

endmodule
