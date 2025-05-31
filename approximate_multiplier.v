// Half Adder Module
module half_adder(
    input x,
    input y,
    output sum_out,
    output carry_out
);
    assign sum_out = x | y;
    assign carry_out = x & y;
endmodule

// Full Adder Module
module full_adder(
    input x,
    input y,
    input cin,
    output sum_out,
    output cout
);
    assign sum_out = x;
    assign cout = y;
endmodule

// Compressor Module
module compressor(
    input i1,
    input i2,
    input i3,
    input i4,
    output comp_sum,
    output comp_carry
);
    assign comp_sum = (i1 ^ i2) ^ (i3 ^ i4);
    assign comp_carry = (i1 & i2) | (i3 & i4);
endmodule

// 4x4 Approximate Multiplier Module
module approx_multiplier(
    input [3:0] in_a,
    input [3:0] in_b,
    output [7:0] prod
);

    // Partial product terms
    wire p0 = in_a[0] & in_b[0];
    wire p1 = in_a[1] & in_b[0];
    wire p2 = in_a[2] & in_b[0];
    wire p3 = in_a[3] & in_b[0];
    wire p4 = in_a[0] & in_b[1];
    wire p5 = in_a[1] & in_b[1];
    wire p6 = in_a[2] & in_b[1];
    wire p7 = in_a[3] & in_b[1];
    wire p8 = in_a[0] & in_b[2];
    wire p9 = in_a[1] & in_b[2];
    wire p10 = in_a[2] & in_b[2];
    wire p11 = in_a[3] & in_b[2];
    wire p12 = in_a[0] & in_b[3];
    wire p13 = in_a[1] & in_b[3];
    wire p14 = in_a[2] & in_b[3];
    wire p15 = in_a[3] & in_b[3];

    // Intermediate propagate/generate
    wire pr1 = p1 | p4;
    wire gn1 = p1 & p4;
    wire pr2 = p2 | p8;
    wire gn2 = p2 & p8;
    wire pr3 = p3 | p12;
    wire gn3 = p3 & p12;
    wire pr4 = p6 | p9;
    wire gn4 = p6 & p9;
    wire pr5 = p7 | p13;
    wire gn5 = p7 & p13;
    wire pr6 = p11 | p14;
    wire gn6 = p11 & p14;

    // LSB assignment
    assign prod[0] = p0;

    // Intermediate wires
    wire t1, t2, t3;
    wire u1, u2;
    wire v1, v2;
    wire w1, w2, w3, w4;

    // Combinational logic
    half_adder ha_1 (.x(pr1), .y(gn1), .sum_out(prod[1]), .carry_out(t1));
    compressor cmp_1 (.i1(pr2), .i2(p5), .i3(gn2), .i4(t1), .comp_sum(t2), .comp_carry(t3));
    compressor cmp_2 (.i1(pr3), .i2(pr4), .i3(gn4), .i4(gn3), .comp_sum(u1), .comp_carry(u2));
    compressor cmp_3 (.i1(pr5), .i2(p10), .i3(gn5), .i4(1'b0), .comp_sum(v1), .comp_carry(v2));
    half_adder ha_2 (.x(t2), .y(t3), .sum_out(prod[2]), .carry_out(w1));
    full_adder fa_1 (.x(u1), .y(u2), .cin(w1), .sum_out(prod[3]), .cout(w2));
    full_adder fa_2 (.x(v1), .y(v2), .cin(w2), .sum_out(prod[4]), .cout(w3));
    full_adder fa_3 (.x(pr6), .y(gn6), .cin(w3), .sum_out(prod[5]), .cout(w4));
    half_adder ha_3 (.x(p15), .y(w4), .sum_out(prod[6]), .carry_out(prod[7]));

endmodule