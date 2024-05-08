import random
import simpy    
import math

# Variables
semilla = 30;
num_peluqueros = 1;
tiempo_corte_min = 15;
tiempo_corte_max = 30;
t_llegadas = 20;
tot_clientes = 5;
te = 0.0  # Tiempo de espera total
dt = 0.0  # Duración del servicio
fin = 0.0  # Minuto en que finaliza

# Procedimientos
def cortar(cliente):
    global dt
    R = random.random()
    tiempo = tiempo_corte_max - tiempo_corte_min
    tiempo_corte = tiempo_corte_min + (tiempo * R)  # Dist. uniforme
    yield env.timeout(tiempo_corte)  # Dejo correr el tiempo n minutos
    print("\o/ Corte listo a %s en %.2f minutos" % (cliente, tiempo_corte))
    dt = dt + tiempo_corte  # Acumula los tiempos de uso de la instalación

def cliente(env, name, personal):
    global te
    global fin
    llega = env.now  # Guarda el minuto de llegada
    print("--› %s llego a la peluqueria en el minuto %.2f" % (name, llega))
    with personal.request() as request:  # Esperar turno
        yield request  # Obtener turno
        pasa = env.now  # Guarda el minuto de llegada del cliente
        espera = pasa - llega
        te = te + espera  # Acumula tiempo de espera
        print(f"{name} Pasa con peluquero en el minuto {round(pasa,2)}.Tiempo de espera {round(espera,2)}")
        yield env.process(cortar(name))  # Llamar al proceso
        deja = env.now  # Guarda el minuto en que termina el proceso
        print("‹--%s deja la peluqueria en minuto %.2f" % (name, deja))
        fin = deja  # Conserva el último minuto de la simulación

def principal(env, personal):
    llegada = 0;
    i=0;
    for i in range(tot_clientes):
        R = random.random()
        llegada = -t_llegadas * math.log(R)
        yield env.timeout(llegada)  # Dejo transcurrir un tiempo entre un cliente y otro
        i=i+1
        env.process(cliente(env, 'Cliente {}'.format(i), personal))

# Programa principal
print("------- Simulacion Peluqueria -------")
random.seed(semilla)
env=simpy.Environment()  # Creo el entorno de simulación
personal = simpy.Resource(env, num_peluqueros)  # Crea los recursos peluqueros
env.process(principal(env, personal))
env.run()  # Iniciar la simulación

# Salidas
print("")
print("Indicadores obtenidos:")
print("")
lpc = te / fin
print("Longitud promedio de la cola: %.2f" % lpc)
tep = te / tot_clientes
print("Tiempo de espera promedio: %.2f" % tep)
upi = (dt / fin) / num_peluqueros