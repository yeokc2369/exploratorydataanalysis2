## Question 2:

## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
## ( fips == "24510" ) from 1999 to 2008?
##
## Use the base plotting system to make a plot answering this question.

## Plot a line graph to display this information

## To begin, read the data file (takes a few seconds)
NEI <- readRDS("summarySCC_PM25.rds")
NEII <- NEI[NEI$fips == "24510",]
AnnualPM25 <- tapply(NEII$Emissions, NEII$year, sum)

##  initiates the PNG graphics device to save to plot2.png
png("plot2.png")

##  produce line graph
plot(names(AnnualPM25), AnnualPM25, type="l",
     xlab="Year", ylab=expression("Total PM2.5 Emissions (tons)"),
     main=expression("Total Baltimore City PM2.5 Emissions by Year"))

##  closes the PNG graphics device
dev.off()
