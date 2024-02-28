def palindromo(palabra):
    palabra = palabra.lower()  
    palabra = ''.join(caracter for caracter in palabra if caracter.isalnum())
    return palabra == palabra[::-1]

palabra = input("Ingresa una palabra:")

if palindromo(palabra):
    print("Es un palíndromo.")
else:
    print("No es un palíndromo.")