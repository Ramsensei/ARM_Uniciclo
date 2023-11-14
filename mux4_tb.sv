module mux4_tb();

    logic [7:0] d0, d1, d2, d3;
    logic [1:0] sel;
    logic [7:0] y;

    mux4 #(8) mux4_inst (
        .d0(d0),
        .d1(d1),
        .d2(d2),
        .d3(d3),
        .sel(sel),
        .y(y)
    );

    initial begin
        // Test case 1
        d0 = 8'b00000001;
        d1 = 8'b00000010;
        d2 = 8'b00000100;
        d3 = 8'b00001000;
        sel = 2'b00;

        // Wait a little bit
        #10;

        // Test case 2 (Change the selection)
        sel = 2'b01;

        // Wait a little bit
        #10;
		  
		  sel = 2'b10;

        // Wait a little bit
        #10;
		  
		  sel = 2'b11;

        // Wait a little bit
        #10;
 
    end

endmodule
