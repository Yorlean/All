#Otro ejemplo con diccionario escribiendo las claves
empleados ={
    "Mario":25,
    "Ana":35,
    "Juan":50
}
for i in empleados:
    print(i)

for i in empleados:
    print(f"El empleado {i} tiene {empleados[i]} años")
