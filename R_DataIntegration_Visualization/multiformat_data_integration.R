#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Librerias 
library(openxlsx)
library(data.table)
library(dplyr)
library(ggplot2)
library(berryFunctions)

#Cargamos las bases de datos 

data_csv <- read.csv("LabradorSeaBirdsV2.csv", sep=',', header = TRUE)

data_txt <- read.table("LabradorSeaBirdsV2.txt", sep = '', header = TRUE)

data_xlsx <- read.xlsx("IMECOCAL_Abril_2011.xlsx",2)

#Para conocer la dimension de un arhcivo del cual no conoces 

length( getSheetNames("IMECOCAL_Abril_2011.xlsx"))


data <- list()

for (i in 1:115) {
  data[[i]] <- read.xlsx("IMECOCAL_Abril_2011.xlsx", i)
}

#Otra manera de hacerlo sin conocer la dimension de un archivo

# data <- list()
# 
# for (i in 1:length( getSheetNames("IMECOCAL_Abril_2011.xlsx"))) {
#   data[[i]] <- read.xlsx("IMECOCAL_Abril_2011.xlsx", i)
# }

# obtener un Summary de manera rapido de la base de datos que se ha cargado

summary(data_csv)
summary(data_csv[3])

#como obtener un encabezado 
head(data_csv, 3)
#ver el final de la base de datos 
tail(data_csv)
# Remove una columna 
data_csv$RowID <- NULL
#Otra manera 
data_csv <- data_csv[, c (-1)]

#Agregar una columna 
data_csv$New_column <- NA
data_csv$New_column2 <- log(data_csv$SST)
data_csv$New_column3 <- seq(1, 3099, 1)

#Remove a row 
data_csv <- data_csv[c(-1), ]

#Añadir nuevos renglones 
data_csv <- insertRows(data_csv, r = c(1,2,3), new = NA)
#Al final del dataFrame 
data_csv[nrow(data_csv)+2, ] <- list(NA)

# Sumamarizing -mean

data_csv %>%
  dplyr::group_by(Month) %>%
  dplyr::summarise(Mean_aves = mean(Birds, na.rm = TRUE))


# Filter and subsets 

data_oct <- data_csv %>% 
  dplyr:: filter(Month == "10")

data_act2 <- droplevels(data_csv[which(data_csv$Month =='10'), ])

#Plot XY
X11()

par(mfrow = c(1,2)) #Primero renglones despues las columnas 

plot(data_csv$SST, data_csv$Birds)
plot(data_csv$Depth, data_csv$Birds)

#Histogramas 
x11()
hist(data_csv$Birds)

#Boxplot
x11()
boxplot(data_csv$Birds)

#Estructuras de control 

#Ver la estructura de nuestra hoja numero 3

str(data[[3]])
summary(data[[3]])

#Añadir un ID  que es el nombre de la estación 
names <- data[[2]]$Linea.Estacion

#Añadimos la nueva columna al DataFrame de la hoja 3

data[[3]]$Linea_estacion <- NA


# Llenar la información con el vector que es de names

data[[3]]$Linea_estacion <- rep(c(names[1]), length(data[[3]]$Linea_estacion))

#Remueve una columna 
data[[3]] <- data[[3]][,c(-1)]

#Remueve una fila 
data[[3]] <- data[[3]][c(-1),]

#Cambiar un valor especifico 
data[[3]]$Salinidad[1]<- 35

#Plotea un histograma 
hist(data[[3]]$Temperatura)

#ver el nombre de las columnas
col_names <- colnames(data[[3]])

# Histograma 
for (h in 1:ncol(data[[3]])) {
  dev.new()
  hist(data[[3]][,h],main=paste0("Histograma of ", col_names[h]), xlab=col_names[h])
}

#Agregar un Id a todas las hojas 
rm(data)

data <- list()

for (i in 1:115) {
  data[[i]] <- read.xlsx("IMECOCAL_Abril_2011.xlsx", i)
}


# Agregar ubn ID

ID_est <- data[[2]]$Linea.Estacion

for (i in 3:length(data)) {
  data[[i]]$ID_est <- NA
  data[[i]]$ID_est<- rep(ID_est[i-2], nrow(data[[i]]))
  
  #Remueve la columna 
  data[[i]] <- data[[i]][ , c(-1)]
}

#Join all dataframes 

Alldata<- do.call(rbind, data[c(3:115)])

#Save the information 
save(Alldata, file="Alldata_IMECOCALI.RData")

#Cargar nuevamente la informacion y se carga nuevamente con AllData
load ("Alldata_IMECOCALI.RData")