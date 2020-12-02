module CPU
(
    clk_i, 
    rst_i,
    start_i
);

// Ports
input               clk_i;
input               rst_i;
input               start_i;

// Wires & Registers
wire [31:0] pc_o, pc_i;
wire [31:0] instr_o;
wire [31:0] RS1data, RS2data;
wire [31:0] Sign_Extend_data_o, MUX_ALUSrc_data_o;
wire [31:0] ALU_data_o;
wire [9:0]  funct;
wire [1:0]  ALUOp;
wire [2:0]  ALUCtr;
wire        ALUSrc, ALUZero, RegWrite;

assign funct = {instr_o[31:25],instr_o[14:12]};

Control Control(
    .Op_i       (instr_o[6:0]),
    .ALUOp_o    (ALUOp),
    .ALUSrc_o   (ALUSrc),
    .RegWrite_o (RegWrite)
);

Adder Add_PC(
    .data1_in   (pc_o),
    .data2_in   (32'd4),
    .data_o     (pc_i)
);

PC PC(
    .clk_i      (clk_i),
    .rst_i      (rst_i),
    .start_i    (start_i),
    .pc_i       (pc_i),
    .pc_o       (pc_o)
);

Instruction_Memory Instruction_Memory(
    .addr_i     (pc_o), 
    .instr_o    (instr_o)
);

Registers Registers(
    .clk_i      (clk_i),
    .RS1addr_i  (instr_o[19:15]),
    .RS2addr_i  (instr_o[24:20]),
    .RDaddr_i   (instr_o[11:7]), 
    .RDdata_i   (ALU_data_o),
    .RegWrite_i (RegWrite),
    .RS1data_o  (RS1data), 
    .RS2data_o  (RS2data) 
);

MUX32 MUX_ALUSrc(
    .data1_i    (RS2data),
    .data2_i    (Sign_Extend_data_o),
    .select_i   (ALUSrc),
    .data_o     (MUX_ALUSrc_data_o)
);

Sign_Extend Sign_Extend(
    .data_i     (instr_o[31:20]),
    .data_o     (Sign_Extend_data_o)
);


ALU ALU(
    .data1_i    (RS1data),
    .data2_i    (MUX_ALUSrc_data_o),
    .ALUCtrl_i  (ALUCtr),
    .data_o     (ALU_data_o),
    .Zero_o     (ALUZero)
);

ALU_Control ALU_Control(
    .funct      (funct),
    .ALUOp_i    (ALUOp),
    .ALUCtrl_o  (ALUCtr)
);


endmodule

