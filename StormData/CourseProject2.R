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

if(!file.exists()){
  download.file(url,"StormData.bz2")
  unzip("StormData.bz2")
}  



library(dplyr)
library(tidyr)
library(lubridate)
library(ggplot2)


df<-stormData

newData<-df %>%
  mutate(Events = as.character(EVTYPE)) %>%
  ### Selecting certain words from events column and giving a common name in a new column
  mutate(Event = ifelse(grepl("TORNADO", Events),"Tornado",
                     ifelse(grepl("Thunderstorm|Wind|THUNDERSTORM|WIND|TSTM|HAIL
                                  |hail|Hail|STORM", Events),"Thunderstorm",
                            ifelse(grepl("Flood|FLOOD|Drowning|DROWNING|DAM", 
                                         Events),"Flood",
                                   ifelse(grepl("Hurricane|HURRICANE", Events),
                                          "Hurricane",
                                          ifelse(grepl("Freeze|FREEZE|Cold|COLD|
                                                       Snow|SNOW|snow|Frost|
                                                       FROST|ICE|Ice|Icy",
                                                       Events),"Freezing",
                                                 ifelse(grepl("RAIN|Rain|
                                                              Precipitation|
                                                              PRECIPITATION|
                                                              Mudslide|MUDSLIDE|
                                                              Wet|wet|WET", 
                                                              Events),"Rainfall",
                                                        ifelse(grepl("HEAT|Heat|
                                                                     DROUGHT|
                                                                     Drought|
                                                                     DRY",
                                                                     Events),
                                                               "Heat",
                                                               ifelse(grepl("FIRE|
                                                                            Fire|
                                                                            WILD",
                                                                            Events),
                                                                      "Fire",
                                                                      "Other"
                     ))))))))) %>%
  select(Event,FATALITIES,INJURIES,PROPDMG,CROPDMG)  %>%
  ### Group by events
  group_by(Event)  %>%  
  ### Take sum of all fatalities, injuries and property damage for each event
  summarise(Fatalities = sum(FATALITIES,na.rm = T),Injuries = sum(INJURIES,na.rm = T),
            Property_Damage = sum(PROPDMG,na.rm = T),Crop_Damage = sum(CROPDMG,na.rm = T))

### Create a subset containing only data related to population health
popHealth <- gather(newData[-6,1:3],Type,Casualties,-Event)

### Plot a bargraph of casualties due to events in the US
png("PopHealth_per_Event.png", height = 400)
g<- ggplot(popHealth,aes(x = Event,y = Casualties, fill = Type))
g + geom_bar(stat="identity", color="black") +
  scale_fill_brewer(palette="Blues")+ 
  labs(title = "Casualties of different events across United States") +
  theme_bw()
dev.off()

### Plot a bargraph of property damage in the US
ecoDamage <- gather(newData[-6,c(1,4,5)],Type,Damages,-Event)

png("EcoConsq_per_Event.png", height = 400)
g <- ggplot(ecoDamage,aes(x = Event,y = Damages, fill = Type))
g + geom_bar(stat="identity", color="black") +
  scale_fill_manual(values =  c("lightblue","steelblue"),labels=c("Crop Damage", "Property Damage"))+ 
  labs(y = "US Dollars") +
  labs(title = "Economic consequences due to different events\nin the United States") +
  theme(axis.title.x=element_text(hjust = 0.5,vjust = 0.5,angle = 45))+
  theme_bw()
dev.off()



newData<- c()  
unique(stormData$EVTYPE)
names(df)







df1<-stormData
df1$Year <- sapply(df1$BGN_DATE,function(x){
  (as.POSIXlt(mdy_hms(x))$year + 1900)
})


datagroupedbyYear<-df1 %>%
  select(Year,FATALITIES,INJURIES,PROPDMG,CROPDMG) %>%
  group_by(Year) %>%
  summarise_all(sum,na.rm = T)
  


