module rom_tb();

logic clock;
logic [7:0]  q;
logic [15:0] address;
rom mem(address, clock, q); 
//Counter cont (clock, rst, 1'b1, address);

endmodule