#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 


#Load packages
pkgs<-c("knitr","mapproj","ggrepel","ggmap","tidyverse",
        "raster","terra", "lubridate","sp","sf",
        "devtools","dplyr","cowplot","gridExtra","grid",
        "lattice","magick","ggspatial", "ncdf4", "ggplot2")

#Load packages
lapply(pkgs,library,character.only=TRUE)


# Load Packages

library(data.table)

#Load data

chim <- read.csv("Data_Chimps.csv", sep= ",", header = TRUE)

str(chim)

# vamos a realizar un histograma 

x11() # desplegar otra ventana y ver los graficos 
hist(chim$Age)
hist(chim$Age, 40) # dividir la grafica el eje en determinado numero de bins

# hacer una grafica con otro color y colocando nombres a los ejes

hist(chim$Age, 20,
     col = "darkred",
     xlab = "Age",
     ylab = "Frecuencia",
     main = "Histograma de edad"
     )

# Outlayer ####

boxplot(chim$Age)
boxplot(chim, ylab = "Datos", col = 'darkred', main="Boxplot de edad")

chim <- chim %>%
  dplyr::arrange(Age)  #Ordenar de mayor a menor toda la informacion de la base de datos


chim$weight <- seq(20,70, length = 243)

x11()
par(mfrow= c(2,1)) # Dividir la ventana en 2 filas una columna 

boxplot( chim$Age,
         ylab = "Age",
         col = "skyblue"
)

boxplot( chim$weight,
         ylab = "weight",
         col = "tomato"
)



# Weight ~ colony 
x11()
boxplot(chim$weight ~ chim$Colony)  #el peso en funcion de la colonia 

x11()
boxplot(chim$weight ~ chim$Colony,
        col = c("blue", "red"),
        ylab = "Weight",
        xlab = "Colony"
        )
#Scatter plot 

plot(chim$weight,
     chim$Age)

x11()
plot(chim$weight,
     chim$Age,
     col = "darkred",
     ylab = "Age",
     xlab = "Weight"
     )

# Filter Boxplot 

chim$Colony[chim$Colony ==1] <- "Western Congo"
chim$Colony[chim$Colony ==2] <- "Eastern Congo"

col1 <- chim[chim$Colony == "Western Congo", ]

x11()
boxplot(col1$weight,
        xlab = "Western Congo",
        ylab = "Weight",
        col = "darkred"
        )

# Save figures usando funciones basicas 
  


# Ejercicios ####

# 1. Agregar una nueva columna cat_age
# 2. Young <= 25 años 
#    Old > 25

# Inicializar la columna cat_age con NA
chim$cat_age <- NA
 
#Asignar "young" a chim con edad <= 25
chim$cat_age[chim$Age <= 25] <- "young"

# Asignar "old" a chimp con edad > 25
chim$cat_age[chim$Age > 25] <- "old"

x11()
boxplot(chim$weight ~ chim$cat_age,
        col = c("blue", "red"),
        ylab = "Weight",
        xlab = "Cat_age"
)


x11()
boxplot(chim$Age ~ chim$Colony,
        col = c("blue", "red"),
        ylab = "Age",
        xlab = "Colony"
)
