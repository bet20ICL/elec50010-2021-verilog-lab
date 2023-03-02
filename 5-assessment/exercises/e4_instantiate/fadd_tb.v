module fadd4_tb();
    logic [7:0] ab;
    logic [3:0] r;
    initial begin
        ab = 0;
        repeat (512) begin
            #1;
            $display("a=%d, b=%d, r=%d", ab[3:0], ab[7:4], r);
            assert(r == ab[3:0] + ab[7:4]) else $fatal(2, "Wrong output");
            ab = ab + 1;
        end
    end
    fadd4 adder(.a(ab[3:0]), .b(ab[7:4]), .r(r));
endmodule