module AND
(
    data0_in,
    data1_in,
    bool_o
);

// Ports
input   data0_in, data1_in;
output  bool_o;

assign bool_o = (data0_in & data1_in);

endmodule
