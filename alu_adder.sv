module alu_adder #(parameter N = 32)
(
    input logic [N-1:0] a,
    input logic [N-1:0] b,
    input logic cin,
    output logic [N-1:0] s,
    output logic cout
);

    assign {cout, s} = a + b + cin;
endmodule
