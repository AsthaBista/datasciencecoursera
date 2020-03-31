## Preparing the data
zippedDat<-unzip("exdata_data_NEI_data.zip")
pmData<-readRDS("summarySCC_PM25.rds")
head(pmData)
sourceClass<-readRDS("Source_Classification_Code.rds")
head(sourceClass)

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

