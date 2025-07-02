#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

# Librerias 
library(ggplot2)

data("mtcars")
head(mtcars)

### Crear un grafico basico 

ggplot()

ggplot(data=mtcars, 
       aes(x=mpg,
           y=wt))+
    geom_point() # Esta linea se le agrega para que se asigne el tipo de grafica que se quiere realizar 

ggplot()+ geom_point(data=mtcars,
                     aes(x = mpg, y = wt))

#Agregar un titulo
x11()
ggplot()+ geom_point(data=mtcars,
                     aes(x = mpg, y = wt))+
        labs(title = "Millas por galon vs peso",x='Millas por galon', y="peso")+
        #Agregar temas 
        #theme_minimal()
        #theme_bw()
        theme_dark()

#Modificar los puntos 

ggplot()+ geom_point(data=mtcars,color = "blue",
                     size=3,
                     shape=7,
                     aes(x = mpg, y = wt))+
  labs(title = "Millas por galon vs peso",x='Millas por galon', y="peso")+
  #Agregar temas 
  #theme_minimal()
  #theme_bw()
  theme_dark()


#Grafico de lineas
ggplot()+ geom_line(data=mtcars,
                    aes(x=hp, y=qsec),
                    color="red",
                    linewidth= 1,
                    linetype=5)+
          labs(title="Caballos de fuerza vs tiempo",
               x= "Caballos de fuerza",
               y= "Tiempo")+
          geom_hline(yintercept = 18,
                     linewidth= 1,
                     linetype=2,
                     color="blue")+
          geom_vline(xintercept = 200,
                     linewidth= 1,
                     linetype= 2,
                     color="green")

#Grafico de barras

ggplot()+ geom_bar(data=mtcars,
                   aes(x=factor(cyl)),
                   fill= "green",
                   color= "black")+
  
            geom_text(data= mtcars,
                      
                      stat="count",
                      aes(x=factor(cyl),
                      label=..count..),
                      vjust= -0.5)+
          #Titulos 
          labs(x="N° de cilindros",y="frecuencia")+
          #Tema 
          theme_bw()


#Cambiar los ejes

ggplot(data=mtcars, 
       aes(x=mpg,
           y=wt))+
  geom_point()
#Limites 
xlim(10,35)+
  ylim(2,5)



ggplot(data=mtcars, 
       aes(x=mpg,
           y=wt))+
  geom_point()+
  scale_x_continuous(breaks = seq(10,35,5))+
  scale_y_continuous(breaks= seq(2,6,0.5))
          
          
#Boxplot
ggplot(data=mtcars, aes(x=factor(cyl),y=wt))+
  geom_boxplot(fill= "lightblue",
               color="darkblue")+
  labs(x="N° de cilindros",
       y="Millas por galón (mi/gal)")+
  theme_minimal()




#Multiples graficas 


ggplot(data=mtcars, 
       aes(x=mpg,
           y=wt))+
  geom_point()+
  facet_wrap(~cyl)+
  theme_classic()



#Personalizar el grafico 

ggplot(data = mtcars,
       aes(x=mpg, y =wt))+
  #Tipo de grafico 
  geom_point()+
  labs(x="N° de cilindros",
       y="Millas por galón (mi/gal)")+
  #Limites 
  xlim(10,35)+
  ylim(1,6)



ggplot(data=mtcars,
       aes(x=mpg,
           y=wt))+
  geom_point()+
  labs(title="Grafico", 
       x="Millas por galon (mi/gal)",
       y="Peso (lbs)")+
  scale_x_continuous(limits= c(10,35),
                     breaks = seq(10,35,5),
                     
                     labels= c("10 mpg","15 mpg","20 mpg",
                               "25 mpg","30 mpg","35 mpg"))+
  scale_y_continuous(limits= c(2,5),
                     breaks = seq(2,5,0.5),
                     
                     labels=c("2 k", "2.5 k", "3 k", 
                              "3.5 k", "4 k", "4.5 k", "5 k"))+
  theme_classic()

#Modificar el titulo 

x11()
ggplot(data = mtcars,
       aes(x=mpg, y =wt))+
  theme_bw()+
  #Tipo de grafico 
  geom_point(fill="darkblue",
             shape=22,
             size=3.5)+
  labs(Title="Peso vs consumo",
    x="N° de cilindros",
       y="Millas por galón (mi/gal)")+
  theme(plot.title = element_text(size = 18,
                                  face="bold",
                                  hjust=0.5,
                                  color="darkblue"))



#Modificar los ejes 

ggplot(data = mtcars, aes(x = mpg, y = wt)) +
  theme_bw() +
  # Tipo de gráfico 
  geom_point(fill = "darkblue", shape = 22, size = 3.5) +
  labs(title = "Peso vs consumo",
       x = "N° de cilindros",
       y = "Millas por galón (mi/gal)") +
  theme(plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "darkblue"),
        axis.text.x = element_text(angle = 35, hjust = 1),
        axis.line.x = element_line(color = "red"),  # Cambia el color de la línea del eje x
        axis.line.y = element_line(color = "red"))  # Cambia el color de la línea del eje y

#Modificar el fondo del grafico

ggplot(data = mtcars, aes(x = mpg, y = wt)) +
  theme_bw() +
  # Tipo de gráfico 
  geom_point(fill = "darkblue", shape = 22, size = 3.5) +
  labs(title = "Peso vs consumo",
       x = "N° de cilindros",
       y = "Millas por galón (mi/gal)") +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "darkblue"),
    axis.text.x = element_text(angle = 35, hjust = 1),
    axis.line.x = element_line(color = "red"),
    axis.line.y = element_line(color = "red"),
    panel.background = element_rect(fill = "green", color = NA), # Fondo del panel de color verde
    panel.grid.major = element_line(color = "blue", size = 1.5), # Líneas de fondo más gruesas de color azul
    panel.grid.minor = element_line(color = "yellow", size = 0.5) # Líneas de fondo más delgadas de color amarillo
  )



ggplot(data = mtcars, aes(x = mpg, y = wt, fill = factor(cyl))) +
  theme_classic() +
  geom_point(shape = 21, size = 3.5, color = "black") + # Puntos circulares con contorno negro
  labs(title = "Peso vs consumo",
       x = "Millas por galón (mi/gal)",
       y = "Peso (1000 lbs)",
       fill = "Número de cilindros") +
  theme(
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5, color = "darkblue"),
    legend.position = "right", # Coloca la leyenda a la derecha
    axis.text.x = element_text(angle = 35, hjust = 1)
  ) +
  scale_fill_manual(values = c("4" = "red", "6" = "blue", "8" = "green")) # Colores diferentes para cada clase de cilindros
  

