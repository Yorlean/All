def contar(cadena):
    cadena = cadena.strip()
    palabras = cadena.split()
    cantidad = len(palabras)
    return cantidad

def main():
    texto = input("Ingrese un texto:")
    cantidad = contar(texto)
    print("La cantidad de palabras del texto es:", cantidad)
if __name__ == "__main__":
    main()