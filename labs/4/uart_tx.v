module uart_tx (
    input wire clk,  //вход тактового сигнала 100 MHz
    input wire [7:0] data,  //входная шина 8 бит данных для передачи
    output reg q = 1'b1,  //выход передатчика
    output reg [2:0] addr_rom = 3'b000  // ROM-адрес передаваемого символа
);

    reg [13:0] cnt = 14'b0;
    reg [3:0] bit_num = 4'b1111;
    reg start;

    wire bit_start = (cnt == 100_000_000 / 9600);  //счетчик для скорости 9600 бод
    wire idle = (bit_num == 4'hF);  //состояние ожидания

    always @(posedge clk) begin
        if (start && idle) begin
            cnt      <= 14'd0;
            addr_rom <= addr_rom + 1'b1;
        end else if (bit_start) begin
            cnt <= 14'd0;
        end else begin
            cnt <= cnt + 14'd1;
        end
    end

    always @(posedge clk) begin
        if (start && idle) begin
            bit_num <= 4'h0;
            q       <= 1'b0;  // передача стартового бита
        end else if (bit_start) begin
            case (bit_num)
                4'h0: begin
                    bit_num <= 4'h1;
                    q       <= data[0];
                end
                4'h1: begin
                    bit_num <= 4'h2;
                    q       <= data[1];
                end
                4'h2: begin
                    bit_num <= 4'h3;
                    q       <= data[2];
                end
                4'h3: begin
                    bit_num <= 4'h4;
                    q       <= data[3];
                end
                4'h4: begin
                    bit_num <= 4'h5;
                    q       <= data[4];
                end
                4'h5: begin
                    bit_num <= 4'h6;
                    q       <= data[5];
                end
                4'h6: begin
                    bit_num <= 4'h7;
                    q       <= data[6];
                end
                4'h7: begin
                    bit_num <= 4'h8;
                    q       <= data[7];
                end
                4'h8: begin
                    bit_num <= 4'h9;
                    q       <= 1'b1;
                end  // передача стоп бита
                default: begin
                    bit_num <= 4'hF;
                    start   <= 1;
                end
            endcase
        end
    end

endmodule
