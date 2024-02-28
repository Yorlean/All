def primo(numero):
    if numero < 2:
        return False
    for i in range(2, int(numero**0.5) + 1):
        if numero % i == 0:
            return False
    return True

def generar(N):
    primos = []
    numero = 2
    while len(primos) < N:
        if primo(numero):
            primos.append(numero)
        numero += 1
    return primos
N = int(input("Ingresa cuántos números primos quieres generar:"))

print("Los primeros", N, "números primos son:")
print(generar(N))