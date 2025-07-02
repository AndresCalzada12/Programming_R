#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# condicionales 

# if 

 a <- 10
 
 if(a == 10){
   
   print("si es un diez")
 }
 
 #if /else
 
 a<- 6
 
 if(a==10){
   print("si es un diez")
   
 } else{
   print("no es diez")}

ifelse(a ==10 , "si es una diez", "no es diez")

# Librerias 
library(openxlsx)
library(dplyr)

#Cargar los datos 
Fish <- read.xlsx("Fish_record.xlsx")

Fish$BinarioSP <- NA

Fish$BinarioSP <- ifelse(Fish$Sp=='C_prin', 0,1 )


# mas de una condicional 

x <- 10
 #Checar si es positivo, negativo o igual a cero 
if (x > 0) {
  print("x es un numero positivo")
} else if(x<0){
  print("x es un numero negativo")
} else{
  print("x es igual a cero")
}

# condiciones anidadas
# Ver si un numero es mayor a 100
 x<- 101
if (x>0) {
  if (x>100) {
    print("X es positivo y mayor a 100")
  }else {
      print("X es positivo y menor a 100")
    }
}else {
  print("X es negativo y menor a 100")
}

# ciclo for o iteraciones 
 
 print("Hello World")
 

 for (i in 1:3) {
   print("Hello World", i)
 }
 
 for (i in 1:4) {
   print(i)
 }
 
 # Estimar el promedio de edad 
 age <- c(35,37,38,50)
 suma <- 0
 
 for (i in 1:length(age)) {
   suma <- suma + age[i]
 }
 
 print(suma)
 promedio <- suma/ length(age)
 
 # While o iteraciones infinitas 
 
 a <- 7
 while (a <10) {
   print("Hello World")
   a <- a+1
 }
 
 