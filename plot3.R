# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

# You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

BaltimoreMD <- subset(NEI, fips == 24510)

BaltimoreMD$year <- factor(BaltimoreMD$year, levels=c("1999", "2002", "2005", "2008"))

png (filename = "plot3.png", width = 800, height = 800, units = "px")

g2 <- ggplot(data = BaltimoreMD, aes(x=year, y=log(Emissions)))

g2 + facet_grid(. ~ type) + guides(fill=F) + geom_boxplot(aes(fill=type)) + stat_boxplot(geom ="errorbar") + geom_point(aes(color = type), size = 5, alpha = 0.10)

dev.off()

