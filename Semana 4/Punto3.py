#Programa Operaciones Matemáticas
print ("Ingrese dos numeros para relalizar operaciones")
N1=int (input("Ingrese el primer numero:"))
N2=int (input("Ingrese el segundo numero:"))
print ("1. Suma de los numeros ingresados")
print ("2. Restamos los numeros ingresados")
print ("3. Dividimos los numeros ingresados")
print ("4. Multiplicamos los numeros ingresados")
print ("Otro valor, no hace nada..")
op =int(input("Ingrese su opcion.."))

if op==1:
    print(f"La suma de los dos numeros es: {N1+N2}")

elif op==2:
    print(f"La resta de los dos numeros es: {N1-N2}")

elif op==3:
    print(f"La division de los dos numeros es: {N1/N2}")

elif op==4:
    print(f"L multiplicacion de los dos numeros es: {N1*N2}")

else:
    print("No escogio una opcion valida")
