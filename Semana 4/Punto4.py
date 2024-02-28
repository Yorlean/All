#Programa IF anidados
print("Ingrese una nota")
nota= float(input("Digite la definitiva:"))

if nota>0 and nota<3.0:
    print("Reprobo")

else:
    if nota>=3.0 and nota <4.0:
        print("Aprobo")

    else:
        if nota>=4.0 and nota <4.5:
            print("Aprobo bien")

        else:
            if nota >4.5 and nota <5.0:
                print("Aprobo excelente")

            else:
                print("Valor invalido")