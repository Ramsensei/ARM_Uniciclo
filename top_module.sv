module top_module(input logic clk, rst,
						input logic [2:0] btn,
						output [31:0] q,
						output [31:0] address);

logic wren, seconds;

logic [7:0] data, addr_wr, addr_cont;


ram mem(address, seconds, data, wren, q);
counter cont(seconds, rst, 1'b1, addr_cont);
hhclock div(seconds, clk)
write_mem escribir(btn, wren, addr_wr, data);
mux_21 mux_addr(addr_wr, addr_cont, rst, address);

endmodule
