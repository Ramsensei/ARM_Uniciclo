module top_module(input logic clk, rst,
						input logic [2:0] btn,
						output [31:0] q,
						output [31:0] address);

logic wren, seconds;

logic [7:0] data, addr_wr, addr_cont;
