# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_ClassifiLosAngelestion_Code.rds")

## Compare emissions from motor vehicle sources in Baltimore City with emissions 
## from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
## Which city has seen greater changes over time in motor vehicle emissions?

selectyears <- factor(NEI$year, levels=c("1999", "2002", "2005", "2008"))

# subset

Baltimore.onroad <- subset(NEI, fips == "24510" & type == "ON-ROAD")
LosAngeles.onroad <- subset(NEI, fips == "06037" & type == "ON-ROAD")

# Aggregate

Baltimore.data <- aggregate(Baltimore.onroad[, "Emissions"], by=list(Baltimore.onroad$year), sum)
colnames(Baltimore.data) <- c("year", "Emissions")
Baltimore.data$City <- paste(rep("Baltimore", 4))

LosAngeles.data <- aggregate(LosAngeles.onroad[, "Emissions"], by=list(LosAngeles.onroad$year), sum)
colnames(LosAngeles.data) <- c("year", "Emissions")
LosAngeles.data$City <- paste(rep("LosAngeles", 4))

DataFrame <- as.data.frame(rbind(Baltimore.data, LosAngeles.data))


# Generate the graph

library(ggplot2)

png (filename = "plot6.png")

ggplot(DataFrame, aes(x=year,y=Emissions)) + 
  geom_bar(aes(fill=year),width=.7,stat="identity") + 
  guides(fill=F) + facet_grid(. ~ City) +
  theme(legend.position='none') + 
  ggtitle("Total PM2.5 emission from motor vehicle sources") + 
  theme(axis.text=element_text(color="black",size=10))+coord_flip()+
  theme(axis.title.x=element_text(color='black',vjust=-1),
        axis.title.y=element_text(color='black',vjust=1.5),
        plot.title=element_text(color="black",size=12,vjust=1))

dev.off()