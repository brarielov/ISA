`timescale 1ns/1ns

module ISA_tb;
    reg [19:0] Instruccion;
    wire [31:0] Sailida;

    ISA instISA (
        .Instruccion(Instruccion),
        .Sailida(Sailida)
    );

    initial begin
        // Prueba 1: Suma
        Instruccion = 20'b00001_00010_1_010_00001_1;
        #100;

        // Prueba 2: AND
        Instruccion = 20'b00011_00110_1_000_01000_1;
        #100;

        // Prueba 3: MayorQ
        Instruccion = 20'b00111_01001_1_111_00011_1;
        #100;

        // Prueba 4: Resta
        Instruccion = 20'b10101_10110_1_0110_10110_1;
        #100;

        $stop;
    end
endmodule
