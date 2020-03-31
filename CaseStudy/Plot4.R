library(dplyr)
library(tidyr)

## Preparing the data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

## ---------------Q.N.4--------------------------------------------
## Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999–2008?

## Merge the two dataframes by SCC
mgd<-merge(pmData,sourceClass,by="SCC")
mgdGp<-mgd %>% group_by(year,Short.Name) %>%   # Group year-wise
  summarize(Total = sum(Emissions,na.rm = TRUE)) # Total emissions

coalEm<-subset(mgdGp,grepl("Coal",mgdGp$Short.Name))

coalGp<-coalEm %>% group_by(year) %>%   # Group year-wise
  summarize(Total = sum(Total,na.rm = TRUE)) # Total emissions

png("Plot4.png")
g<-ggplot(coalGp,aes(x=year,y=Total))
g + geom_line()+
  labs(x = "Year")+
  labs(y =  expression("Total "*PM[2.5]* " emissions in tons") ) +
  labs(title = expression("Coal Related Emissions of  "*PM[2.5]* " emissions in tons in US from 1999 - 2008"))+
  geom_point(color = "blue",pch = 17, size = 3)+
  theme_bw()
dev.off() 

## The coal-related emissions have decreased from 1999 - 2008
##