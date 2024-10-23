`timescale 1ns/1ns

module ISA(
	input [19:0] Instruccion,
	output [31:0] Sailida
);

	//Dato 1 y 2 del banco de registro que va al operando 1 y 2 de la ALU
	wire [31:0] d1BR_op1ALU;
	wire [31:0] d2BR_op2ALU;
    	wire [31:0] aluRes;

	RegisterFile instRegisterFile(
		.DL1(Instruccion[19:15]),
		.DL2(Instruccion[14:10]),
		.DE(0),
		.Dato(0),
		.WE(Instruccion[9]),
		.Op1(d1BR_op1ALU),
		.Op2(d2BR_op2ALU)
	);

	ALU instALU(
		.Op1(d1BR_op1ALU),
		.Op2(d2BR_op2ALU),
		.AluOp(Instruccion[8:6]),
		.Res(aluRes)
	);

	RAM instRAM (
        	.DatoE(aluRes),
        	.DirRam(Instruccion[5:1]),
        	.WE(Instruccion[0])
    	);
endmodule
