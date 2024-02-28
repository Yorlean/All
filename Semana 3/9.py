import random

def juego():
    numero_secreto = random.randint(1, 100)

    print("Bienvenido al juego de adivinanza")
    print("Estoy pensando en un número entre 1 y 100, adivina cuál es")

    while True:
        numero = int(input("Ingresa tu numero: "))

        if numero < numero_secreto:
            print("El número secreto es mayor que", numero)
        elif numero > numero_secreto:
            print("El número secreto es menor que", numero)
        else:
            print("Adivinaste el número secreto", numero_secreto)
            break

juego()