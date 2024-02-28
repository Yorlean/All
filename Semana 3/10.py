def agregar (lista):
    elemento = input ("Ingrese el elemento que desea agegar a la lista de compras:")
    lista.append (elemento)
    print ("elemento agregado a la lista de compras.")

def mostrar (lista):
    if lista:
        print("Lista de compras actual:")
        for i, elemento in enumerate (lista, 1):
            print (f"{i}.{elemento}")
    else:
        print ("La lista de compras esta vacia.")

def elminar (lista):
    if lista:
        mostrar (lista)
        indice = int(input("Ingrese el numero del elemento que desea eliminar:")) -1
        if 0 <= indice < len (lista):
            elemento_eliminado = lista.pop (indice)
            print (f"se ha eliminado '{elemento_eliminado} de la lista de compras")
        else:
            print ("Numero de elemento invalido")
    else:
        print ("La lista de compras esta vacia")



def gestionar ():
    lista_compras = []
    while True:
        print ("\nOpciones:")
        print ("1. Agregar elemento a la ista de compras.")
        print ("2. Mostrar lista de compras")
        print ("3. Eliminar elemento de la lista de compras.")
        print ("4. Salir del progama.")

        opcion = input ("Seleccione una opcion:")

        if opcion == "1":
            agregar (lista_compras)
        elif opcion == "2":
            mostrar (lista_compras)
        elif opcion == "3":
            elminar (lista_compras)
        elif opcion == "4":
            print ("Gracias por usar esta lista de compras")
            break
        else:
            print ("Opcion invalida. Por favor, seleccione una opcion valida")

gestionar()