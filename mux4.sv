module mux4 #(parameter WIDTH = 8)
    (input logic [WIDTH-1:0] d0, d2, d3,
     input logic [1:0] sel,
     output logic [WIDTH-1:0] y);

    wire [WIDTH-1:0] mux0_out, mux1_out;

    mux2 #(WIDTH) mux0 (.d0(d0), .d1(d0), .s(sel[0]), .y(mux0_out));
    mux2 #(WIDTH) mux1 (.d0(d2), .d1(d3), .s(sel[0]), .y(mux1_out));

    mux2 #(WIDTH) muxi (.d0(mux0_out), .d1(mux1_out), .s(sel[1]), .y(y));
endmodule
