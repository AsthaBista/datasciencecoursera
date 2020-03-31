library(dplyr)
library(tidyr)

## Preparing the data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

## ---------------Q.N.5--------------------------------------------
## How have emissions from motor vehicle sources changed from 
## 1999–2008 in Baltimore City?

pmsub<-subset(pmData,fips == "24510") # Baltimore City, Maryland
## Merge the two dataframes by SCC
mgd<-merge(pmsub,sourceClass,by="SCC")
mgdGp2<-mgd %>% group_by(year,Short.Name) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

## Select all source of pollution having "Motor" in them
motorEm<-subset(mgdGp,grepl("[Mm]otor",mgdGp$Short.Name))

motorGp<-motorEm %>% group_by(year) %>%   # Group year-wise
  summarize(Total = sum(Total,na.rm = TRUE)) # Total emissions

png("Plot5.png")
g<-ggplot(motorGp,aes(x=year,y=Total))
g + geom_line()+
  labs(x = "Year")+
  labs(y =  expression("Total "*PM[2.5]* " emissions in tons") ) +
  ggtitle(expression("Motor vehicles Emissions of  "*PM[2.5]* " in Baltimore City, Maryland from 1999 - 2008"))+
  geom_point(color = "blue",pch = 17, size = 3)+
  theme_bw()
dev.off() 

## The  motor related emissions have increased from 1999 - 2008
##