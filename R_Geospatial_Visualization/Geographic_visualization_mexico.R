#clean space console 

rm(list=ls(all=TRUE)) #limpiar el ambiente 
graphics.off() #quitar todas las figuras que estan en el ambiente 
gc() #eliminar todo el cache 

#sistemas de información geografica 


pkgs <- c("rnaturalearthdata", "rnaturalearth")
# Librerias 
library(ggplot2)
library(ggspatial)

new.packages <- pkgs[!(pkgs%in% installed.packages()[, "Package"])]
if(length(new.packages)) install.packages(new.packages)

lapply(pkgs, library, character.only=TRUE)


world <- ne_countries(type="countries", scale ="small")

ggplot(world)+
  geom_sf() #Ayuda a visualizar los objetos 

#Para ver México 

Mex <- ne_countries(country = "mexico", scale = "large")

ggplot(Mex)+
  geom_sf()


#plot(ne_countries(country = "mexico", scale="large"))

MexSt <- ne_states(country = "mexico")

#Solo delimitar a que se vean los estados de mexico 
ggplot(MexSt)+
  geom_sf()

ggplot(MexSt)+
  geom_sf(color = "red", fill="blue")

#Para delimitar la bahia de ensenada 

# Crear un ggplot que luego se modificará para delimitar la Bahía de Ensenada
MexP <- ggplot(MexSt) +
  geom_sf(color = "pink", fill = "red")

# Delimitar a la Bahía de Ensenada usando coord_sf
MexP +
  coord_sf(xlim = c(-116.8654, -116.5332), ylim = c(31.66044, 31.93651), expand = FALSE)



# Delimitar a la Bahía de Ensenada usando coord_sf
MexP +
  coord_sf(xlim = c(-116.8654, -116.5332), ylim = c(31.66044, 31.93651), expand = FALSE)+
  annotation_scale(location="bl", width_hint=0.4)+
  annotation_north_arrow(location="bl", which_north="true",
                         pad_x=unit(0.0, "in"), pad_y=unit(0.2, "in"),
                         style=north_arrow_fancy_orienteering)




