module mul16(input clk, input logic[15:0] a, input logic[15:0] b, output logic[15:0] r);
    always_ff @(posedge clk) begin
        r <= a * b;
    end
endmodule

module shift16(input clk, input logic[15:0] a, input logic[3:0] distance, output logic[15:0] r);
    logic [15:0] b;
    always @(*) begin
        case (distance)
        0: begin b  =   16'b1; end
        1: begin b  =   16'b10; end
        2: begin b  =   16'b100; end
        3: begin b  =   16'b1000; end
        4: begin b  =   16'b10000; end
        5: begin b  =   16'b100000; end
        6: begin b  =   16'b1000000; end
        7: begin b  =   16'b10000000; end
        8: begin b  =   16'b100000000; end
        9: begin b  =   16'b1000000000; end
        10: begin b =   16'b10000000000; end
        11: begin b =   16'b100000000000; end
        12: begin b =   16'b1000000000000; end
        13: begin b =   16'b10000000000000; end
        14: begin b =   16'b100000000000000; end
        15: begin b =   16'b1000000000000000; end
        endcase
    end

    logic [15:0] r_reg;
    always_ff @(posedge clk) begin
        r <= r_reg;
    end

    mul16 mul(.clk(clk), .a(a), .b(b), .r(r_reg));
    // a << dist = a * (2 ** dist)
endmodule