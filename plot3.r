## Question 3:

## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad)
## variable, which of these four sources have seen decreases in emissions from 1999–2008
## for Baltimore City? Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

## Call the relevant libraries
library(plyr)
library(ggplot2)

## Read the data file (takes a few seconds)
NEI <- readRDS("summarySCC_PM25.rds")
NEII <- NEI[NEI$fips == "24510",]
TypePM25 <- ddply(NEII, .(year, type), function(x) sum(x$Emissions))
colnames(TypePM25)[3] <- "Emissions"

##  initiates the PNG graphics device to save to plot3.png
png("plot3.png")

##  produce line graphs
qplot(year, Emissions, data=TypePM25, color=type, geom="line") +
  ggtitle(expression("Baltimore City PM2.5 Emissions by Source Type and Year")) +
  xlab("Year") +
  ylab(expression("Total PM2.5 Emissions (tons)"))

##  closes the PNG graphics device
dev.off()

