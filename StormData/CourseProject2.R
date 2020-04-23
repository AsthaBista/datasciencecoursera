getwd()
setwd("./StormData")
url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
temp <- tempfile()
download.file(url,temp)
unzip(temp,list = TRUE)
stormData<- read.csv(temp)
unlink(temp)
head(stormData)
nrow(stormData)
View(stormData)

library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)


df<-stormData

newData<-df %>%
  mutate(Events = as.character(EVTYPE)) %>%
  ### Selecting certain words from events column and giving a common name in a new column
  mutate(Event = ifelse(grepl("TORNADO", Events),"Tornado",
                     ifelse(grepl("Thunderstorm|Wind|THUNDERSTORM|WIND|TSTM|HAIL|hail|Hail|STORM", Events),"Storm",
                            ifelse(grepl("Flood|FLOOD|Drowning|DROWNING|DAM", Events),"Flood",
                                   ifelse(grepl("Hurricane|HURRICANE", Events),"Hurricane",
                                          ifelse(grepl("Freeze|FREEZE|Cold|COLD|Snow|SNOW|snow|Frost|FROST|ICE|Ice|Icy", Events),"Freezing",
                                                 ifelse(grepl("RAIN|Rain|Precipitation|PRECIPITATION|Mudslide|MUDSLIDE|Wet|wet|WET", Events),"Rainfall",
                                                        ifelse(grepl("HEAT|Heat|DROUGHT|Drought|DRY|FIRE|Fire", Events),"Heat",
                                                               ifelse(grepl("FIRE|Fire|WILD", Events),"Heat","Other"
                     ))))))))) %>%
  select(Event,FATALITIES,INJURIES,PROPDMG)  %>%
  ### Group by events
  group_by(Event)  %>%  
  ### Take sum of all fatalities, injuries and property damage for each event
  summarise(Fatalities = sum(FATALITIES,na.rm = T),Injuries = sum(INJURIES,na.rm = T),
            Property_Damage = sum(PROPDMG,na.rm = T))

### Create a subset containing only data related to population health
popHealth <- gather(newData[-5,1:3],Type,Casualties,-Event)

### Plot a bargraph of casualties due to events in the US
png("PopHealth_per_Event.png", height = 400)
g<- ggplot(popHealth,aes(x = Event,y = Casualties, fill = Type))
g + geom_bar(stat="identity", color="black") +
  scale_fill_brewer(palette="Blues")+ 
  labs(title = "Casualties of different events across United States") +
  theme_bw()
dev.off()

### Plot a bargraph of property damage in the US
ecoDamage <- newData[-5,c(1,4)]
png("EcoConsq_per_Event.png", height = 400)
g <- ggplot(ecoDamage,aes(x = Event,y = Property_Damage))
g + geom_bar(stat="identity", fill="steelblue") + 
  labs(y = "Property Damage in US Dollars") +
  labs(title = "Economic consequences due to different events in the United States") +
  theme_bw()
dev.off()



newData<- c()  
unique(stormData$EVTYPE)
names(df)










as.POSIXlt(mdy_hms(stormData$BGN_DATE[1]))+(a$hour*60)+a$min
a = as.POSIXlt(strptime(as.character(stormData$BGN_TIME[1]),format = "%H%M"))
a$min

newData<-stormData %>%
  mutate(Time = as.POSIXlt(strptime(as.character(stormData$BGN_TIME),format = "%H%M"))) %>%
  mutate(Date = as.POSIXlt(mdy_hms(BGN_DATE)) + (Time$hour*60) + (Time$min)) %>%
  select(Date,EVTYPE,FATALITIES,INJURIES)

df<-stormData
df$Time <- sapply(df$BGN_TIME,function(x){
  as.POSIXlt(strptime(as.character(df$BGN_TIME),format = "%H%M"))
})
  
