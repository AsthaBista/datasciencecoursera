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
