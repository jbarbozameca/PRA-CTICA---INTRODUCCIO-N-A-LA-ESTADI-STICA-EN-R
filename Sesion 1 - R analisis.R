#Bases para la escritura en R
a<-1
b<-2
c<-a+b

y<-50
z<-10
j<-y*z
j

pacientes<-c("Pedro","Juan","Benito")
pacientes

comorbilidad<-c("Diabetes","Hipertension","Cancer")

edad<-c(30,40,50)
edad

#####################################################################3
install.packages("readxl")
library(readxl)
install.packages("foreign")
library(foreign)
install.packages("epiDisplay")
library(epiDisplay)
install.packages("epitools")
library(epitools)
install.packages("tableone")
library(tableone)

#Asignando un nuevo nombre a nuestra base de datos
variabilidad<-Base_variabilidad
View(variabilidad)

# Conocer nuestras variables (str)

str(variabilidad)
#Transformando la naturaleza de las variables: Cualitativas (factor)
variabilidad$BPN<-factor(variabilidad$BPN,
                         levels = c(2,1),
                         labels = c("Bajo peso al nacer",
                                    "Eutrófico"))

variabilidad$VARIABILIDAD<-factor(variabilidad$VARIABILIDAD,
                                  levels = c(2,1),
                                  labels = c("No",
                                             "Si"))

variabilidad$`GRADO DE INSTRUCCIÓN`<-factor(variabilidad$`GRADO DE INSTRUCCIÓN`)

variabilidad$ANEMIA<-factor(variabilidad$ANEMIA)

variabilidad$`CONTROL PRENATAL`<-factor(variabilidad$`CONTROL PRENATAL`,
                                        levels = c(2,1),
                                        labels = c("Inadecuado",
                                                   "Adecuado"))

str(variabilidad)

View(variabilidad)


#Observar Nº de pacientes y Nº de variables (dim)
dim(variabilidad)

#Observar los primeros 10 casos de nuestra base de datos
head(variabilidad)

#Resumir los valores (datos)
summary(variabilidad)

# Prueba de normalidad
install.packages("nortest")
library(nortest)
## Evaluar la normalidad con K-S
lillie.test(variabilidad$EDAD)

## Evaluar la normalidad con S-W
shapiro.test(variabilidad$EDAD)

## Histograma
hist(variabilidad$EDAD,
     main = "Distribución de la edad materna",
     xlab = "Edad",
     ylab="Frecuencia")


# Evaluar la media y mediana
mean(variabilidad$EDAD)
median(variabilidad$EDAD)

# Evaluar el SD y Rango (IQR)
sd(variabilidad$EDAD)
range(variabilidad$EDAD)

summary(variabilidad$EDAD)

# Generar una tabla UNIVARIADA
library(tableone)
tabla1<-CreateTableOne(data=variabilidad)
tabla1=print(tabla1,showAllLevels = T)
write.csv(tabla1,file="Tabla_univariada.csv")




