# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

# You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the Baltimore MD?
## Use the base plotting system to make a plot answering this question.

library(ggplot2)
library(plyr)
library(data.table)


# Subseting data related to Baltimore MD

BaltimoreMD <- subset(NEI, fips == "24510")

head(BaltimoreMD)

# Total all emissions in Baltimore MD, 1999 - 2008

BaltimoreMD <- tapply(BaltimoreMD$Emissions, BaltimoreMD$year, sum)


# Plot emissions per year

png (filename = "plot2.png")

barplot(BaltimoreMD, col = rainbow(25, start = 0, end = 1), xlab = "Year", ylab = "Total PM2.5 Emissions", main = "Yearly Emissions (tons) in BaltimoreMD")

dev.off()




