import random
import string

def generar(longitud):
    caracteres = string.ascii_letters + string.digits + string.punctuation
    contraseña = ''.join(random.choice(caracteres) for _ in range(longitud))
    return contraseña

longitud = int(input("Ingrese la longitud para la contraseña:"))

contraseña = generar(longitud)

print("La contraseña segura generada es:", contraseña)