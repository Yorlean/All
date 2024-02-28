#Cargaremos la edad en una variable
edad= int(input("Ingrese una edad:"))

if edad<18:
    print("Es menor")

elif edad<40:
    print("Adulto joven..")

elif edad<60:
    print("Adulto experimentado")

else:
    print("Adulto mayor")