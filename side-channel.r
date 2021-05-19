library(ggplot2)
library(plot3D)
library(plot3Drgl)
library(rgl)
library(Rcmdr)
library(aplpack)

library(readxl)
Sammamish_Side_Channel_Intern_Data <- read_excel("C:/Users/morgan.gower/Desktop/Sammamish Side Channel Intern Data.xlsx", 
                                                 sheet = "Sheet2", col_types = c("text", 
                                                                                 "numeric", "numeric", "numeric", 
                                                                                 "numeric", "date"))
View(Sammamish_Side_Channel_Intern_Data)

#boxplot for temp-----------------------------------------------------------------

boxplot(Temp~Site,data = Sammamish_Side_Channel_Intern_Data,
        main = "Temperature Range of Samammish SC Sites",
        sub = "July 10th 2019 - Oct. 12th 2019",
        xlab = "Site Number", ylab = "Tempreratures (deg C)",
        col = "red")

#boxplot for DO-----------------------------------------------------------------

boxplot(DO~Site,data = Sammamish_Side_Channel_Intern_Data, 
        main = "DO Range of Samammish SC Sites",
        sub = "July 10th 2019 - Oct. 12th 2019",
        xlab = "Site Number", ylab = "Dissolved Oxygen (mg/L)",
        col = "lightblue")

#boxplot for Specific Conductivity-----------------------------------------------

boxplot(SConductivity~Site,data = Sammamish_Side_Channel_Intern_Data,
        main = "Specific Conductivity Range of Samammish SC Sites",
        sub = "July 10th 2019 - Oct. 12th 2019",
        xlab = "Site Number", ylab = "Spec. Conduct.",
        col = "purple")

#boxplot for pH-------------------------------------------------------------------

boxplot(pH~Site,data = Sammamish_Side_Channel_Intern_Data,
        main = "pH Range of Samammish SC Sites",
        sub = "July 10th 2019 - Oct. 12th 2019",
        xlab = "Site Number", ylab = "pH",
        col = "yellow")

#ggplot for DO------------------------------------------------------------------

ggplot(Sammamish_Side_Channel_Intern_Data, aes(Site, DO)) + geom_boxplot(aes(fill = Site)) + theme(legend.position = "none") +
  labs(title = "DO Samm SC")

#ggplot for Temp -----------------------------------------------------------------

ggplot(Sammamish_Side_Channel_Intern_Data, aes(Site, Temp)) + geom_boxplot(aes(fill = Site)) + theme(legend.position = "none") + labs(title = "Temp Samammish Side Chanel")


#scatter plots-------------------------------------------------------------------

attach(Sammamish_Side_Channel_Intern_Data)
plot(DO, Temp, main="Temp vs DO", 
     xlab="DO mg/L ", ylab="Temprature degree C ", pch=19)
# Add fit lines
abline(lm(Temp~DO), col="red") # regression line (y~x) 



# Spinning 3d Scatterplot-------------------------------------------------------



attach(Sammamish_Side_Channel_Intern_Data)
plot3d(Temp,DO,Site, main="3D Scatterplot")

# Spinning 3d Scatterplot------------------------------------------------------


plot3d(DO, Temp, Site, col="red", size=3)


attach(Sammamish_Side_Channel_Intern_Data)
scatter3d(DO, Temp, SConductivity)

# Example of a Bagplot--------------------------------------------------------------

attach(Sammamish_Side_Channel_Intern_Data)
bagplot(DO,Temp, xlab="DO mg/L", ylab="Temp Deg C",
        main="Bagplot of Temp vs. DO")
