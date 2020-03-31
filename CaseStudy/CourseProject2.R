library(dplyr)
library(ggplot2)



setwd("C:/Users/Aastha/Desktop/datasciencecoursera/CaseStudy")
## Preparing the data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

## ---------------Q.N.1--------------------------------------------
## Have total emissions from PM2.5 decreased in the United States 
## from 1999 to 2008? Using the base plotting system, make a plot
## showing the total PM2.5 emission from all sources for each of the 
## years 1999, 2002, 2005, and 2008.

pmGp<-pmData %>% group_by(year) %>%     # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE))  # Total emissions
pmGp[1,2]>pmGp[4,2]   

## Plot a bargraph of total emissions year-wise
png("Plot1.png")
barplot(pmGp$Total,
        names.arg = pmGp$year,
        main = "Total emissions in tons",
        xlab = "Year",
        col = "steelblue")
dev.off()    

## TRUE. The total emissions have decreased from 1999 to 2008

## ---------------Q.N.2-------------------------------------------- 
## Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (\color{red}{\verb|fips == "24510"|}fips=="24510") from 
## 1999 to 2008? Use the base plotting system to make a plot 
## answering this question.

pmsub<-subset(pmData,fips == "24510") # Baltimore City, Maryland
pmsubGp<-pmsub %>% group_by(year) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions
pmsubGp[1,2]>pmsubGp[4,2] 

## Plot a bargraph of total emissions year-wise
png("Plot2.png")
barplot(pmsubGp$Total,
        names.arg = pmGp$year,
        main = "Total emissions in tons for Baltimore City, Maryland",
        xlab = "Year",
        col = "steelblue")
dev.off() 

## TRUE. The total emissions have decreased 
## from 1999 to 2008 in Baltimore City, Maryland

## ---------------Q.N.3--------------------------------------------
## Of the four types of sources indicated by the \color{red}{\verb|type|}
## type (point, nonpoint, onroad, nonroad) variable, which of these four 
## sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 
## plotting system to make a plot answer this question.

pmsubGp2<-pmsub %>% group_by(year,type) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

png("Plot3.png")
g<-ggplot(pmsubGp2,aes(x=year,y=Total))
g + geom_bar(stat="identity", fill="steelblue")+
  labs(x = "Year")+
  labs(y = "Total emissions (tons)")+
  labs(title = "Total emissions in Baltimore City, Maryland")+
  facet_wrap(.~pmsubGp2$type)+
  theme_bw()
dev.off() 

## Non-road, Nonpoint, and On-road types of sources of pollution
## saw decrease in emissions from 1990 to 2008
## Point emissions saw an increase in emissions from 1990 to 2008














