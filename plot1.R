# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

# You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

library(ggplot2)
library(plyr)
library(data.table)

## see structure and figures 

str(NEI)

head(NEI)

str(SCC)

head(SCC)

Totalemissions <-aggregate(NEI[, "Emissions"], by=list(NEI$year), FUN=sum)

Totalemissions$PM <- round(Totalemissions[,2]/1000,2)

Totalemissions$PM



# Plot emissions per year

png (filename = "plot1.png")

barplot(Totalemissions$PM, col = rainbow(25, start = 0, end = 1), names.arg = Emissions$Group.1, main = expression("Total Emission"), xlab="Year", ylab = expression("PM in kT"))

dev.off()





