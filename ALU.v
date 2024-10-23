module ALU (
	input [31:0] Op1,	//Operando 1
    	input [31:0] Op2,       //Operando 2
    	input [3:0] AluOp,      //Selector Operacion
    	output reg [31:0] Res	//Resultado
);

	always @(*) begin
    		case (AluOp)
			//AND
        		4'b0000: Res = Op1 & Op2;
			
			//OR
        		4'b0001: Res = Op1 | Op2;

			//Suma
        		4'b0010: Res = Op1 + Op2;

			//Resta
        		4'b0110: Res = Op1 - Op2;

			//MayorQ
			4'b0111: Res = Op1 > Op2 ? 1 : 0;
			
			//Valor por defecto
        		default: Res = 32'b0;
    		endcase
	end
endmodule
