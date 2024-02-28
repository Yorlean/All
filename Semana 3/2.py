def fibonacci(numero):
    secuencia = [0, 1]
    for i in range(2, numero):

        secuencia.append(secuencia[-1] + secuencia[-2])
    return secuencia[:numero]

N = int(input("Ingresa cuántos números de la secuencia Fibonacci quieres generar:"))
print("Los primeros", N,"numeros de la secuencia Fibonnaci son:", fibonacci(N))