module Zero
(
    data0_in,
    data1_in,
    zero_o
);

// Ports
input  [31:0] data0_in, data1_in;
output        zero_o;

assign zero_o = (data0_in == data1_in)? 1'b1 : 1'b0;

endmodule
