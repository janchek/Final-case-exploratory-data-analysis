# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

# You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

head(NEI)

Baltimore.onroad <- subset(NEI, fips == 24510 & type == "ON-ROAD")

# Aggregate

Onroad <- aggregate(Baltimore.onroad[, "Emissions"], by=list(Baltimore.onroad$year), sum)

colnames(Onroad) <- c("year", "Emissions")

# Generate the graph 

library(ggplot2)

png (filename = "plot5.png", width = 800, height = 800, units = "px")

ggplot(Onroad, aes(x=factor(year), y=Emissions)) + guides(fill=F) + geom_bar(stat="identity", fill = "grey") + theme_bw()+ xlab("year") + ylab(expression("total PM2.5 emissions")) + ggtitle("Emissions from motor vehicle sources in Baltimore City")

dev.off()