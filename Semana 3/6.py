import random

def tirar():
    return random.randint(1, 6)  

dado1 = tirar()
dado2 = tirar()

print("Resultado del primer dado:", dado1)
print("Resultado del segundo dado:", dado2)