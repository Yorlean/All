def calculo_futuro(inversion_inicial, tasa_interes, años):
    valor_futuro = inversion_inicial * (1 + tasa_interes / 100) ** años
    return valor_futuro

inversion_inicial = float(input("Ingrese la inversión inicial:"))
tasa_interes = float(input("Ingrese la tasa de interés anual:"))
años = int(input("Ingrese el número de años:"))

valor_futuro = calculo_futuro(inversion_inicial, tasa_interes, años)

print("El valor futuro de la inversión será:", valor_futuro)