#EJERCICIO DE LA CLASE 1 
# DIA 9/05/24

#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 


# a) crea un 
# vector que se llame seassons y que incluya spring, summer, winter and fall

seasons <- c("Summer", "Winter", "Winter", "Fall")

# b) Crea un vecor de 20 elementos que tenga valores entre 100 y 1000

elmt <- seq(100, 1000, 20)

# c) Crea un vector que contenga una secuencia numerica que vaya del 1 al 12 
# y crea otro vector en el que se repita la secuencia anterior 10 veces 

vec <- seq(1, 12)
rep <- rep(vec, times = 10)

# D) la funcion LETTERS arroja un vector con las letras del abecedario. Indica 
# cuantos elementos tiene y que tipo de objeto es 

letras <- letters
# TIENE 26 ELEMENTOS 
# CARACTERES 

# E) Filtra los elementos 5,8, 13, 15, 24 del vector de LETTERS

fil <- c(letras[5], letras[8], letras[13], letras[15], letras[24])

# Otra forma de hacer es
# letras[c(5,8,13,15,24)]

# F) Contruye una matriz de 10x10 que solo incluya numeros impares 

num_imp <- seq(1, by = 2, length.out = 100)
num_imp2 <- seq(1,100, by= 2)

matriz_impares <- matrix(num_imp2, nrow = 10, ncol = 10, byrow = TRUE)

# G) Extrae el valor almacenado en la columna 3 y renglon 8 de la matriz generada 
# en f), extrae solo los valores en el renglo 3 y despues extrae los valores en la
# columna 5

tres <- matriz_impares[8,3]
reng_3 <- matriz_impares[3,]
col_5 <- matriz_impares[, 5]

# H) De la matriz del inciso f) extrae todos los valores de las columnas 3,5 y 7.
# con ellas genera un dataframe que se llame numeros. Nombra las columnas del DataFrame 
# como tres, cinco y siete 

tres <- matriz_impares[, 3]
cinco <- matriz_impares[, 5]
siete <- matriz_impares[, 7]

nom <- c("Tres", "Cinco", "Siete")

df <- data.frame(Tres = tres, Cinco = cinco, Siete = siete)

# I) Construya un dataframe con las respuestas de tres de tus compañeros a las preguntas 
# ¿Cual es tu nombre?
# ¿Ultimo grado de estudios?
# ¿Cual es tu estatura?
# Agrega las respuestas de tu compañero en las columnas "Nom", "Grado" y "Est"

Nom <- c("Dafne", "Esmeralda", "Andres")
Grado <- c("Licenciatura", "Licenciatura", "Licenciatura")
Est <- c(1.57, 1.57, 1.70)

Comp <- data.frame(Nom, Grado, Est)

# J) Cambia el nombre del DataFrame en i) con los siguientes nombres "Nombre", 
# "Grado" y "Estatura"

colnames(Comp)<- c("Nombre", "Grado", "Estatura")

# K) Crea una lista con los objetos creados en a) b) f) e i)

lista <- list(seasons, elmt, matriz_impares, Comp)

#  l) Extrae la matriz de la lista k) y asignala con el nombre de matriz 

matriz <- lista[[3]]

# M) dentro del objeto lista en k) modifica el DataFrame, agregando una cuarta columna
# en la que se tenga la informacion sobre la comida favorita 

Comida <- c('Pozole', "Ceviche", "Ecnchiladas")

lista[[4]]$Comida <- Comida


# N) Extrae la informacion de las tres personas del dataFrame de la lista 
# en j) y asiganalas respecto al nombre de la comlumna nombre 

Nombre_1 <- Comp$Nombre
  

# Operaciones logicas ####

# Suma = +
# Resta = -
# Multiplicacion = ^ o **
# Division /
# Raiz cuadrada = sqrt()
# 
# #operaciones Lógicas
# Igual ==
# menor que <
# Mayor que >
# Mayor o igual >=
# Menor o igual <=
# Diferente = !=

2+2
2-2
2*2
sqrt(4)
2/2
2**2
2^2

DF <- lista[[4]]

#Obtener las variables que se asocien a Dafne 
Dafne <- DF[DF$Nombre == "Dafne",]
ValoresM1 <- DF[DF$Estatura > 1,]

