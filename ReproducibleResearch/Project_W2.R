setwd("C:/Users/Aastha/Desktop/datasciencecoursera/ReproducibleResearch")

## 
url<-"https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
z<-tempfile()
download.file(url,z)
file<- unzip(z)
data <- read.csv(file)
unlink(z)
head(data)
