module shift16_tb();
    logic clk;
    logic [15:0] a;
    // logic [15:0] b;
    logic [15:0] r;
    logic [3:0] distance;

    logic [15:0] a_d1;
    // logic [15:0] b_d1;
    logic [3:0] distance_d1;

    logic [15:0] a_d2;
    // logic [15:0] b_d2;
    logic [3:0] distance_d2;

    initial begin
        clk = 0;
        forever begin
            #2 clk = !clk;
        end
    end

    always_ff @(posedge clk) begin
        a_d1 <= a;
        distance_d1 <= distance;

        a_d2 <= a_d1;
        distance_d2 <= distance_d1;
    end

    localparam integer STEPS = 1000;
    initial begin
        a = 0;
        distance = 0;
        @(negedge clk);
        repeat (STEPS) begin
            // @(posedge clk)
            @(negedge clk);
            $display("a=%b, distance=%d, r=%b", a_d2, distance_d2, r);
            // assert( r == a_d2 << distance_d2) else $fatal(2, "Error");
            assert( r == a_d2 << distance_d2) else $display("Error");
            a = a + 16'h1234;
            distance = distance + 4'h3;
        end 
        $finish(0);
    end

    shift16 m(.clk(clk), .a(a), .distance(distance), .r(r));
    // mul16 m(.clk(clk), .a(a), .b(b), .r(r));
endmodule