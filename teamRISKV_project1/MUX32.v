module MUX32
(
    data1_i, 
    data2_i,
    select_i,
    data_o
);

// Ports
input  [31:0] data1_i, data2_i;
input         select_i;
output [31:0] data_o;
 
// 0 for first; 1 for second
assign data_o = (select_i == 1'b0) ? data1_i :
                (select_i == 1'b1) ? data2_i : 32'bx;

endmodule