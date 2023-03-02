module my_fadd(input a, input b, input cin, output r, output cout);
    // r = a ^ b ^ c
    // cout = (a^b)c + ab
    //      00 01 11 10
    // 0    0  0  1  0
    // 1    0  1  1  1

    logic a_xor_b;
    bxor xor1(.a(a), .b(b), .r(a_xor_b));
    bxor xor2(.a(a_xor_b), .b(cin), .r(r));

    logic or_op1;
    band and1(.a(a_xor_b), .b(cin), .r(or_op1));
    logic or_op2;
    band and2(.a(a), .b(b), .r(or_op2));
    
    bor or1(.a(or_op1), .b(or_op2), .r(cout));
endmodule

module fadd4(input logic[3:0] a, input logic[3:0] b, output logic[3:0] r);
    logic cout0;
    logic cout1;
    logic cout2;
    logic cout3;
    my_fadd fadd1(.a(a[0]), .b(b[0]), .cin('0), .r(r[0]), .cout(cout0));
    my_fadd fadd2(.a(a[1]), .b(b[1]), .cin(cout0), .r(r[1]), .cout(cout1));
    my_fadd fadd3(.a(a[2]), .b(b[2]), .cin(cout1), .r(r[2]), .cout(cout2));
    my_fadd fadd4(.a(a[3]), .b(b[3]), .cin(cout2), .r(r[3]), .cout(cout3));
endmodule