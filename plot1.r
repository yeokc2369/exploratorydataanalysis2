## Question 1:

## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
##
## Using the base plotting system, make a plot showing the total PM2.5 emission
## from all sources for each of the years 1999, 2002, 2005, and 2008.

## Plot a line graph to display this information

## To begin, read the data file (takes a few seconds)
NEI <- readRDS("summarySCC_PM25.rds")
AnnualPM25 <- tapply(NEI$Emissions, NEI$year, sum)

##  initiates the PNG graphics device to save to plot1.png
png("plot1.png")

##  produce line graph
plot(names(AnnualPM25), AnnualPM25, type="l",
     xlab="Year", ylab=expression("Total PM2.5 Emissions (tons)"),
     main=expression("Total US PM2.5 Emissions by Year"))

##  closes the PNG graphics device
dev.off()
