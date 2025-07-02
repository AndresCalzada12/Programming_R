#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Librerias 
library(openxlsx)
library(dplyr)

#Cargar los datos 
Fish <- read.xlsx("Fish_record.xlsx")
kk <- read.xlsx("Fish_record.xlsx", "Turcoparasitos")

Fish2<-read.xlsx("Fish_record.xlsx", "Fish", 10, colNames = FALSE)

unique(Fish$Sp)
unique(Fish$Sex)

# histograma de frecuencia de la longitud total para cada una de las especies
# histograma de frecuencia de la longitud total para cada uno de los sexos
# 
# Estrctura de los datos
# codigo 
# fecha 
# longitud total cm "Tl_cm"
# peso total Kg "TW_kg"
# peso gonada g "GW_g"
# Sexo "Sex"
# Especie "sp"


# Agrupar por especie y extraer la columna de longitud total
Fish_by_species <- Fish %>%
  group_by(Sp) %>%
  select(Sp, TL_cm)

especies <- unique(Fish$Sp)

# Histograma para la primera especie
Fish_species1 <- Fish_by_species %>% filter(Sp =="C_prin") %>% pull(TL_cm)
hist(Fish_species1, 
     main = paste("Histograma de Longitud Total para", especies[1]), 
     xlab = "Longitud Total (cm)", 
     ylab = "Frecuencia", 
     col = "blue")

# Histograma para la segunda especie
Fish_species2 <- Fish_by_species %>% filter(Sp == "S_dor") %>% pull(TL_cm)
hist(Fish_species2, 
     main = paste("Histograma de Longitud Total para", especies[2]), 
     xlab = "Longitud Total (cm)", 
     ylab = "Frecuencia", 
     col = "blue")



# Agrupar por sexo y extraer la columna de longitud total
Fish_by_sex <- Fish %>%
  group_by(Sex) %>%
  select(Sex, TL_cm)

sexos <- unique(Fish$Sex)

# Histograma para el primer sexo
Fish_sex1 <- Fish_by_sex %>% filter(Sex == "M") %>% pull(TL_cm) #Pull es extraer la columna de un DataFrame como un vector 
hist(Fish_sex1, 
     main = paste("Histograma de Longitud Total para Sexo", sexos[1]), 
     xlab = "Longitud Total (cm)", 
     ylab = "Frecuencia", 
     col = "red")

# Histograma para el segundo sexo
Fish_sex2 <- Fish_by_sex %>% filter(Sex == "F") %>% pull(TL_cm)
hist(Fish_sex2, 
     main = paste("Histograma de Longitud Total para Sexo", sexos[2]), 
     xlab = "Longitud Total (cm)", 
     ylab = "Frecuencia", 
     col = "red")