# set working directory

setwd("C:/Users/mihaldma/Documents/coursera/EXPLORATORY DATA ANALYSIS/final project exploratory data analysis")

dir()

# You can read each of the two files using the readRDS() function in R. For example, reading in each file can be done with the following code:

## This first line will likely take a few seconds. Be patient!

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?


# Coal combustion find relevant

SCC.coalcomb = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]

# Merge two data sets

merge <- merge(x=NEI, y=SCC.coalcomb, by="SCC")

merge.sum <- aggregate(merge[, "Emissions"], by=list(merge$year), sum)

colnames(merge.sum) <- c("Year", "Emissions")

merge.sum

# Generate the graph 

library(ggplot2)

png (filename = "plot4.png")

ggplot(data = merge.sum, aes(x = Year, y = Emissions / 1000)) + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) + geom_text(aes(label = round(Emissions / 1000, digits = 1), size = 2, hjust = 1.5, vjust = 1.5)) + theme(legend.position = "none")


dev.off()

