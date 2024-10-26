import tkinter as tk
from tkinter import ttk

def generar_instruccion():
    # Obtener valores de las entradas o asignar 'xxxxx' si están vacías
    operando1 = entrada_operando1.get() or 'xxxxx'
    operando2 = entrada_operando2.get() or 'xxxxx'
    direccion_ram = entrada_direccion_ram.get() or 'xxxxx'
    
    # Convertir los valores a binario, asegurando que tengan 5 bits
    operando1_bin = f"{int(operando1):05b}" if operando1.isdigit() else 'xxxxx'
    operando2_bin = f"{int(operando2):05b}" if operando2.isdigit() else 'xxxxx'
    direccion_ram_bin = f"{int(direccion_ram):05b}" if direccion_ram.isdigit() else 'xxxxx'
    
    # Leer el estado de los checkboxes
    habilitar_br = '1' if var_habilitar_br.get() else '0'
    habilitar_ram = '1' if var_habilitar_ram.get() else '0'
    
    # Obtener la operación seleccionada del dropdown
    operacion_seleccionada = dropdown_operacion.get()
    operaciones_bin = {'Suma': '010', 'Resta': '110', 'AND': '000', 'OR': '001', 'MayorQ': '111', 'Ninguna': 'xxx'}
    operacion_bin = operaciones_bin[operacion_seleccionada]

    # Generar la instrucción final en formato binario
    instruccion = f"{operando1_bin}_{operando2_bin}_{habilitar_br}_{operacion_bin}_{direccion_ram_bin}_{habilitar_ram}"
    salida_instruccion.config(text=f"Instrucción: {instruccion}")

# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Decodificador de Instrucciones (20 bits)")
ventana.geometry("500x400")

# Etiquetas y entradas para los operandos
tk.Label(ventana, text="Operando 1:").grid(row=0, column=0, padx=10, pady=5, sticky="w")
entrada_operando1 = tk.Entry(ventana)
entrada_operando1.grid(row=0, column=1, padx=10, pady=5)

tk.Label(ventana, text="Operando 2:").grid(row=1, column=0, padx=10, pady=5, sticky="w")
entrada_operando2 = tk.Entry(ventana)
entrada_operando2.grid(row=1, column=1, padx=10, pady=5)

# Checkbox para Habilitar Escritura BR
var_habilitar_br = tk.IntVar()
checkbox_br = tk.Checkbutton(ventana, text="Habilitar Escritura BR", variable=var_habilitar_br)
checkbox_br.grid(row=2, column=0, columnspan=2, padx=10, pady=5, sticky="w")

# Dropdown para seleccionar la operación ALU
tk.Label(ventana, text="Operación ALU:").grid(row=3, column=0, padx=10, pady=5, sticky="w")
dropdown_operacion = ttk.Combobox(ventana, values=["Suma", "Resta", "AND", "OR", "MayorQ", "Ninguna"])
dropdown_operacion.grid(row=3, column=1, padx=10, pady=5)
dropdown_operacion.current(0)  # Seleccionar "Suma" por defecto

# Entrada para la dirección RAM
tk.Label(ventana, text="Dirección RAM:").grid(row=4, column=0, padx=10, pady=5, sticky="w")
entrada_direccion_ram = tk.Entry(ventana)
entrada_direccion_ram.grid(row=4, column=1, padx=10, pady=5)

# Checkbox para Habilitar Escritura RAM
var_habilitar_ram = tk.IntVar()
checkbox_ram = tk.Checkbutton(ventana, text="Habilitar Escritura RAM", variable=var_habilitar_ram)
checkbox_ram.grid(row=5, column=0, columnspan=2, padx=10, pady=5, sticky="w")

# Botón para generar la instrucción
boton_generar = tk.Button(ventana, text="Generar Instrucción", command=generar_instruccion)
boton_generar.grid(row=6, column=0, columnspan=2, padx=10, pady=20)

# Etiqueta para mostrar la instrucción generada
salida_instruccion = tk.Label(ventana, text="Instrucción: ")
salida_instruccion.grid(row=7, column=0, columnspan=2, padx=10, pady=5)

# Ejecutar la ventana principal
ventana.mainloop()
