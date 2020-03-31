library(dplyr)
library(tidyr)

## Preparing data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

## ---------------Q.N.6--------------------------------------------
## Compare emissions from motor vehicle sources in Baltimore City 
## with emissions from motor vehicle sources in Los Angeles County, 
## California (\color{red}{\verb|fips == "06037"|}fips=="06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

pmsub1<-subset(pmData,fips == "24510") # Baltimore City, Maryland
pmsub2<-subset(pmData,fips == "06037") # Los Angeles Couty, California

## For Baltimore
## Merge the two dataframes by SCC
mgd1<-merge(pmsub1,sourceClass,by="SCC")
mgdGp1<-mgd1 %>% group_by(year,Short.Name) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

## Select all source of pollution having "Motor" in them
motor1<-subset(mgdGp1,grepl("[Mm]otor",mgdGp1$Short.Name))

motorB<-motor1 %>% group_by(year) %>%   # Group year-wise
  summarize(Baltimore = sum(Total,na.rm = TRUE)) # Total emissions

## For LA
## Merge the two dataframes by SCC
mgd2<-merge(pmsub2,sourceClass,by="SCC")
mgdGp2<-mgd2 %>% group_by(year,Short.Name) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

## Select all source of pollution having "Motor" in them
motor2<-subset(mgdGp2,grepl("[Mm]otor",mgdGp2$Short.Name))

motorL<-motor2 %>% group_by(year) %>%   # Group year-wise
  summarize(LA = sum(Total,na.rm = TRUE)) # Total emissions

# Merge two dataframes in Baltimore and LA
combined<-merge(motorB,motorL,by="year")
combined<-gather(combined,City,Emissions,-year)


png("Plot6.png")
g<-ggplot(combined,aes(x=year,y=Emissions))
g + geom_line(aes(color = City))+
  labs(x = "Year")+
  labs(y =  expression("Total "*PM[2.5]* " emissions in tons") ) +
  ggtitle(expression("Motor vehicles Emissions of  "*PM[2.5]* " in two cities from 1999 - 2008"))+
  geom_point(aes(color = City),pch = 17, size = 3)+
  theme_bw()
dev.off() 

## The  motor related emissions in LA have greater change from 1999 - 2008
##