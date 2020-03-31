library(dplyr)
library(tidyr)

## Preparing the data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

## ---------------Q.N.3--------------------------------------------
## Of the four types of sources indicated by the \color{red}{\verb|type|}
## type (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 
## plotting system to make a plot answer this question.

pmsub<-subset(pmData,fips == "24510") # Baltimore City, Maryland
pmsubGp2<-pmsub %>% group_by(year,type) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

png("Plot3.png")
g<-ggplot(pmsubGp2,aes(x=year,y=Total))
g + geom_bar(stat="identity", fill="steelblue")+
  labs(x = "Year")+
  labs(y = expression("Total "*PM[2.5]* " emissions in tons"))+
  labs(title = expression(paste("Total Emissions of  ",PM[2.5], " emissions in tons in Baltimore City, Maryland from 1999 - 2008")))+
  facet_wrap(.~pmsubGp2$type)+
  theme_bw()
dev.off() 

## Non-road, Nonpoint, and On-road types of sources of pollution
## saw decrease in emissions from 1990 to 2008
## Point emissions saw an increase in emissions from 1990 to 2008

