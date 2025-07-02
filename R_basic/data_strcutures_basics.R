
#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Asignación de variables ####

a <- 1+1
class(a) #Para poder ver la clase a la cual pertence 

# Vectores ####

b <- c(1,2,3,4,5,6,7,8,9,10)
b.2 <- seq(1,10,1) #con pasos de 1 en 1 o se pueden cambiar los pasos para hacer la secuencia 
b.3 <- c(1:10)


c <- c("Miriel", 'Yalina', 'Mariana', 'Karen', 'Daniela', 
       'Cinthia', 'Andres', 'Ixchel')

d <- c(1, 'Miriel') #En un vector todo los objetos van a pertencer a una misma 
                    # clase 

#Matrices ####
e <-matrix(seq(1,9,1), nrow = 3, ncol = 3)
e.1 <- matrix(seq(1,9,1), nrow = 3, ncol = 3, byrow = TRUE)

view(e) #Para visualizar una variable como un solo archvi
#Acceder a un elemento de la matriz 

e.1[2,2] #Accediendo a ese valor por medio de filas y de columnas 
e.1[3,] #Accediendo a todo el renglon de la matriz 
e.1[,3] #Accediendo a la tercer columna de la matriz 

#subconjunto para nombrar los renglones y columnas de la matriz 
cnames <- c("uno", "dos", "tres")
rnames <- c("Miriel", 'Rafa', 'Andres')

e.2 <- matrix(seq(1,9,1), nrow = 3, ncol = 3, byrow = TRUE, 
              dimnames = list(rnames, cnames))



# Arreglos #### 
f <- array(c(1:9), dim = c(3,3,3)) #dim = c(3,3,3) el ultimo 3 nos da la profundidad 

f.1 <- array(data = c(1:27), dim = c(3,3,3))

#acceder a un elemento del array los elementos son nombre.[renglon, columna]
f.1[3,3,3]
f.1[2, , 2]

# DataFrames####
#EL primer vector es una secuencia del 1 al 10 
#Primer ejemplo para hacer un DataFrame

No <- c(1:10)
Nombre <- c('Miriel', 'Rafa', 'Mariana', 'Yalina', 'Karen', 'Daniela',
            'Cinthia', 'Ixchel', 'Andres', 'Masao')
Edad <- c(11,12,13,14,15,16,17,18,19,20)

Nacionalidad <- c('Mex', 'Mex','Mex','Cub', 'Mex','Cub', 'Mex', 'Mex', 'Mex', 'Mex')

#Data Frame
k <- data.frame(Numero=No, Nom=Nombre, Edad=Edad, Nacionalidad = Nacionalidad)

#str(k) es una función que nos da la información del dataframe 
# Cambiar los titulos de las columnas de una Dataframe 
# colnames(k)<- c('No','Nombre', 'Edad') el vector de caracteres debe de tener el mismo tamaño 
# Para accesar a un elemento del DataFrame.
# k[Renglon, columna]
# k$Edad
# Para accesar a un solo elemento es 
# k$Edad[10] con el corchete se encuentra el elemento de la variable en la cual se esta trabajando 
# Para obtener sub conjuntos de datos 
# Todos los valores de las personas que son mexicanas 

# El operado $ es exclusivo del DataFrame 


# k[k$Nacionalidad ==''Mex, ]

# Mexico <- k[k$Nacionalidad == 'Mex', ]

# Menores <- k[k$Edad < 18,]


#Menores de 18 años pero que sean cubanos 

# cuba <- k[k$Edad < 18 & k$Nacionalidad == 'Cub',]


# Agregar una columna a nuestro dataframe 
# Se crea el data frame 
Posgrado <- c('fisica', 'Marina', 'c. vida','c. tierra', 'c. vida', 'marina',
              'marina', 'c. computacion', 'c. computacion', 'marina') 

k$Postgrado <- Posgrado  #el primero nombre es el de la columna indeoendiente de las variables que se le asignen 
k$Posgrado <- Posgrado

# eliminar una columna 

k <- k[,-c(5)]

# Factores ####

#Ayudan a tener variables 

Postgrado_factor <- factor(k$Posgrado)
#Para saber que tipos de valores tengo en mi funcon posgrado 
unique(Postgrado_factor)

k$Posgrado[k$Posgrado=='Marina'] <- c('marina')


# Listas 

kk <- list(a, b, e, f.1, k)

Escalar <- kk[[1]]
Matriz <- kk[[3]]
DataFrame <- kk[[5]]

#Acceder a una elemento o a una fila de la lista 

kk[[3]][2,]

Est_cuba <- kk[[5]][Nacionalidad == 'Cub',]

#Tambien se puede de esta manera 
# kk[[5]][kk[[5]]$Nacionalidad == "Cub",]

genero <- c('Mujer', 'Mujer')

Est_cuba$Genero <- genero

# Agregar a mi dataFrame de la lista una nueva columna con edades 

k$Estatura <- rep(1,10,1)
#Como agregamos este DataFrame a nuestra lista
m<- k

kk <- list(a, b, e, f.1, k,m)

#Agregar una columna al Data Frame 
kk[[5]]$Color<-rep("red", 10)

# Regrsando a la lista 
# como es que podemso hacer un subconjunto de una lista 

kk

# Agregar una nueva columna al Dataframe dentro de una lista 

kk[[5]]$Posgrado<-c('fisica', 'Marina', 'c. vida','c. tierra', 'c. vida', 'marina',
              'marina', 'c. computacion', 'c. computacion', 'marina')



