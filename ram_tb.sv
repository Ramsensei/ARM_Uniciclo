module ram_tb();

logic clock, wren, rst;
logic [7:0] data, q;
logic [15:0] address;
ram mem(address, clock, data, wren, q); 
//Counter cont (clock, rst, 1'b1, address);

endmodule