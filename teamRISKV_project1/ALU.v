`define AND  3'b000
`define XOR  3'b001
`define SLL  3'b010
`define ADD  3'b011
`define SUB  3'b100
`define MUL  3'b101
`define ADDI 3'b110
`define SRAI 3'b111

module ALU
(
    data1_i,
    data2_i,
    ALUCtrl_i,
    data_o,
    Zero_o
);

// Ports
input  [2:0]  ALUCtrl_i;
input signed [31:0] data1_i, data2_i;
output [31:0] data_o;
output Zero_o;

// Wires & Registers
reg signed [31:0] data_reg;

assign data_o = data_reg;
assign Zero_o = ((data1_i - data2_i) == 0) ? 1'b1 : 1'b0;

always @(data1_i or data2_i or ALUCtrl_i) begin
    case (ALUCtrl_i)
        `AND:    data_reg = data1_i  & data2_i;
        `XOR:    data_reg = data1_i  ^ data2_i;
        `SLL:    data_reg = data1_i << data2_i;
        `ADD:    data_reg = data1_i  + data2_i;
        `SUB:    data_reg = data1_i  - data2_i;
        `MUL:    data_reg = data1_i  * data2_i;
        `ADDI:   data_reg = data1_i  + data2_i;
        // `SRAI:   data_reg = $signed(data1_i) >>> data2_i[4:0];
        `SRAI:   data_reg = data1_i >>> data2_i[4:0];
        default: data_reg = data1_i;
    endcase
end

endmodule
