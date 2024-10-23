module RegisterFile (
	input [4:0] DL1,	//Direccion Lectura 1
	input [4:0] DL2,	//Direccion Lectura 2
    	input [4:0] DE,		//Direccion Escritura
    	input [31:0] Dato,	//Dato
    	input WE,		//Escritura Habilitada
    	output reg [31:0] Op1,	//Operando 1
    	output reg [31:0] Op2	//Operando 2
);

	// Banco de Registros de 32 registros de 32 bits
    	reg [31:0] BR [31:0];

    	always @(*) begin
		//Escritura
        	if(WE) begin
			BR[DE] = Dato;
		end
		
		//Lectura
		Op1 = BR[DL1];
		Op2 = BR[DL2];
    	end
endmodule

