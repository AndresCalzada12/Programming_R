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

AA <- read.csv("AA2000.csv", sep= ",", header = TRUE)


# 1.	De la base de datos original genera dos dataframes: GM y Pacifico, seleccionando nueve columnas. 
# NOMBRE.SITIO.DESEMBARQUE
# NOMBRE.ESTADO
# NOMBRE.OFICINA
# TIPO.AVISO
# MES.CORTE
# NOMBRE.PRINCIPAL
# NOMBRE.ESPECIE
# PESO.DESEMBARCADO
# LITORAL

# Filtrar las filas para GM y Pacifico (aquí estoy suponiendo que hay una columna llamada 'LITORAL' que tiene valores que indican GM o Pacifico)
# Filtrar las filas para GM y Pacifico usando la columna LITORAL
GM <- subset(AA, LITORAL == "GOLFO Y CARIBE")[, c("NOMBRE.SITIO.DESEMBARQUE", "NOMBRE.ESTADO", 
                                    "NOMBRE.OFICINA", "TIPO.AVISO", "MES.CORTE", 
                                    "NOMBRE.PRINCIPAL", "NOMBRE.ESPECIE", 
                                    "PESO.DESEMBARCADO")]
Pacifico <- subset(AA, LITORAL == "PACIFICO")[, c("NOMBRE.SITIO.DESEMBARQUE", 
                                                  "NOMBRE.ESTADO", "NOMBRE.OFICINA", 
                                                  "TIPO.AVISO", "MES.CORTE", 
                                                  "NOMBRE.PRINCIPAL", 
                                                  "NOMBRE.ESPECIE", "PESO.DESEMBARCADO")]

# 2.	Cambiar el nombre de las columnas seleccionadas:
#   Sitio_desem
# Edo
# Of
# Pesq
# Mes
# Grupo
# Sp
# Vol_kg
# Cambiar los nombres de las columnas en GM 
colnames(GM) <- c("Sitio_desem", "Edo", "Of", "Pesq", "Mes", "Grupo", "Sp", "Vol_kg")

# Cambiar los nombres de las columnas en Pacifico
colnames(Pacifico) <- c("Sitio_desem", "Edo", "Of", "Pesq", "Mes", "Grupo", "Sp", "Vol_kg")


# 3.	Cambiar las categorías de la columna ¨Pesq¨
# 
# Mayores a Industrial
# Menores a Artesanal

GM$Pesq[GM$Pesq=='MAYORES'] <- "Industrial"
GM$Pesq[GM$Pesq=='MENORES'] <- "Artesanal"

Pacifico$Pesq[Pacifico$Pesq=='MAYORES'] <- "Industrial"
Pacifico$Pesq[Pacifico$Pesq=='MENORES'] <- "Artesanal"

# 4.	Crear una columna nueva que se llame Vol_ton, en la que se convierta Vol_kg a toneladas.

#Inicializar una variable vacia para ambos 
GM$Vol_ton <- NA

Pacifico$Vol_ton <- NA

#Convertimos los kilogramos a toneladas 

GM$Vol_ton <- GM$Vol_kg/1000
Pacifico$Vol_ton <- Pacifico$Vol_kg/1000


# 5.¿Cuántos grupos existen en cada litoral? ¿Cuál litoral reporta un mayor número de grupos?

length(unique(GM$Grupo))
#Este litoral de Golfo de México reporta 48 grupos 

length(unique(Pacifico$Grupo))
#Este litoral de Golfo de México reporta 55 grupos

#Por lo tanto el litoral que reporta mayor numero de grupos es Pacifico

#6.Calcula el volumen total de desembarque (toneladas) por grupo para cada litoral (GM y Pacifico) 

# Cálculo para Golfo de México usando dplyr
GM_volumen_grupo <- GM %>%
  group_by(Grupo) %>%
  summarise(Vol_ton = sum(Vol_ton))

# Calculo para Pacifico usando dplyr
Pacifico_volumen_grupo <- Pacifico %>%
  group_by(Grupo) %>%
  summarise(Vol_ton = sum(Vol_ton))

# 7.Realiza un boxplot que incluya el volumen total de desembarque por litoral.
x11()

boxplot(GM_volumen_grupo$Vol_ton,
        ylab = "Tonelada",
        xlab = "Grupo",
        main="Volumen total por grupo de GM")

boxplot(Pacifico_volumen_grupo$Vol_ton
        ,
        ylab = "Tonelada",
        xlab = "Grupo",
        main="Volumen total por grupo de Pacifico")

#8.Filtra los grupos y solo trabaja con aquellos que reporten un volumen menor a 10,000 toneladas.

GM_menor <- GM_volumen_grupo[GM_volumen_grupo$Vol_ton < 10000, ]
Pacifico_menor <- Pacifico_volumen_grupo[Pacifico_volumen_grupo$Vol_ton < 10000,]

#Pacifico_menor <- data.frame(Vol_ton = Pacifico_volumen_grupo[Pacifico_volumen_grupo < 10000])

# Graficando los boxplots
x11()

boxplot(GM$Vol_ton,
        ylab = "Tonelada",
        xlab = "Grupo",
        main="Volumen total por grupo de GM Menor a 10,000 Toneladas")


boxplot(Pacifico$Vol_ton,
        ylab = "Tonelada",
        xlab = "Grupo",
        main="Volumen total por grupo de Pacifico Menor a 10,000 Toneladas")