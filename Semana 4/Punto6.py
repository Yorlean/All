#Programa Leectura de Números Positivos
print("Debe ingresar dos numeros positivos")
N1 = int(input("Ingrese el numero 1:"))
N2 = int(input("Ingrese el numero 2:"))

while N1<0 or N2<0:
    print("Error → Debe ingresar un numero positivo, para calcular la suma")
    N1 =int(input("Ingrese numero 1:"))
    N2 =int(input("Ingrese numero 2:"))
print(f"El valor de la suma es: {N1+N2}")