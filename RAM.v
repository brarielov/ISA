module RAM (
    	input [31:0] DatoE,   // Dato a almacenar (desde la ALU)
    	input [4:0] DirRam,   // Direcci�n de la memoria (bits [5:1] de la instrucci�n)
	input WE             // Habilitaci�n de escritura (bit [0] de la instrucci�n)
);

	reg [31:0] Memoria [31:0]; // Memoria RAM

    	// Escritura asincr�nica
    	always @(*) begin
        	if (WE) begin
            		Memoria[DirRam] = DatoE;
        	end
	end
endmodule
