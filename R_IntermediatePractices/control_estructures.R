#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Librerias 
library(openxlsx)
library(dplyr)
library(ggplot2)

data_coral <- list()

for (i in 1:5) {
  data_coral[[i]]<- read.xlsx("Coral_disease.xlsx", i)
}

for (i in 2:5) {
  #Para la pirmer hoja del Excel se elimina el pirmer renglon ,se agrega una columna
  # nueva de ID
  ID <-colnames(data_coral[[i]][1])
  #Agregar encabezados que es la segunda linea de mi encabezado
  colnames(data_coral[[i]])<- data_coral[[i]][1,]
  #Eliminar el primer renglon de el dataFrame 
  data_coral[[i]]<- data_coral[[i]][-c(1),]
  data_coral[[i]]<- data_coral[[i]][,-c(1)]
  #Agregar una columna que identifque la base de datos de la colonia 
  data_coral[[i]]$Colony <- NA
  data_coral[[i]]$Colony <- rep(ID, nrow(data_coral[[i]]))
}

#Para la pirmer hoja del Excel se elimina el pirmer renglon ,se agrega una columna
# nueva de ID
#ID <-colnames(data_coral[[2]][1])
#Agregar encabezados que es la segunda linea de mi encabezado
#colnames(data_coral[[2]])<- data_coral[[2]][1,]
#Eliminar el primer renglon de el dataFrame 
#data_coral[[2]]<- data_coral[[2]][-c(1),]
#data_coral[[2]]<- data_coral[[2]][,-c(1)]
#Agregar una columna que identifque la base de datos de la colonia 
#data_coral[[2]]$Colony <- NA
#data_coral[[2]]$Colony <- rep(ID, nrow(data_coral[[2]]))

# Para cambiar las columnas de caracteres a numeros

for (j in 1:11) {
  data_coral[[2]][,j]<-as.numeric(data_coral[[2]][,j])
}

# Vamos a cambiar nuestra lista a dataFrame de las listas del 2 al 5 en un solo 
# DataFrame

data_coral2 <-do.call(rbind, data_coral[c(2:5)])


