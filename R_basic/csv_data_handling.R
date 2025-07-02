# La clase de hoy es para revisar y trabajar base de datos desde formatos de 
# .csv

#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Load Packages

library(data.table)

#Load data

data <- read.csv("Turcoparasitos.csv", sep= ",", header = TRUE)

#Para ver la estructura de la base de datos 
str(data)

# Para ver los nombres de las columnas 
names(data)

# Encabezado de la base de datos 

head(data, 2) # Solo dos renglones 

# Para ver como terminal la base de datos 

tail(data, 2) # solo ver el numero de elementos que queremos visualizar

# Para ver un resumen de como esta compuesta la base de datos 

summary(data)

# Para solo extraer el resumen de solo una columna 

summary(data[3]) # Por el numero 
summary(data$LT) # Por el nombre si es que no se conoce la posición

unique(data$SEX) # Dos elementos en la columna de Sexo para conocer el numero de tipos de elementos que tiene la columna 

unique(data$Location)

range(data$LT) # Intervalo de valores que tiene esta columna 

range(data$Totalparasites)

#Remover una columna 

data$ID <- NULL

# Cambiar el nombre de una de las columnas

colnames(data)[colnames(data) == 'Location'] <- "Loc"


# Para ver los valores NA

colSums(is.na(data))

# Hacer opraciones dentro de la base de datos 
# filtras datos, sumar, añadir datos al dataframe

library(tidyr)
library(dplyr)

# La seintaxis que se toma al usar las librerias 

# data%>%

# filtrar los datos de la localidad 1

data %>% dplyr::filter(Loc == 1 & Totalparasites > 50)


data[data$Loc == 1 & data$Totalparasites > 50, ]

# Media de cada una de las localidades
# Sumarizing data 

data%>% dplyr::group_by(Loc)%>% #Agrupado por localidad 
        dplyr::summarise(Mean = mean(Totalparasites, na.rm = TRUE))


data%>% dplyr::group_by(SEX)%>% #Agrupado por sexo
  dplyr::summarise(Mean = mean(Totalparasites, na.rm = TRUE))

# Filtra solo para machos el cual es el 1
# agrupa los datos por localidad 
# Crea una nueva columna llamada Mean Parasites que incluya el promedio por sexo 

data %>%
  dplyr::filter(SEX == 1)  %>%
  dplyr::group_by(Loc)  %>%
  dplyr::summarise(Mean = mean(Totalparasites, na.rm=TRUE))
