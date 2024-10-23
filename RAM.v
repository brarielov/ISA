module RAM (
    	input [31:0] DatoE,   // Dato a almacenar (desde la ALU)
    	input [4:0] DirRam,   // Dirección de la memoria (bits [5:1] de la instrucción)
	input WE             // Habilitación de escritura (bit [0] de la instrucción)
);

	reg [31:0] Memoria [31:0]; // Memoria RAM

    	// Escritura asincrónica
    	always @(*) begin
        	if (WE) begin
            		Memoria[DirRam] = DatoE;
        	end
	end
endmodule
