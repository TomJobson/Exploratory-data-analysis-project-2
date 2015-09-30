##PLOT1
## libraries
require(ggplot2)

## set work dir
setwd("K:\Documents\DATA SCIENCE\NEW GIT HUB\Exploratory-Data-Analysis-Project-2")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
file = "summarySCC_PM25.rds"
NEI <- readRDS(file)

## -----------------------------------------------------------------------------
## elaborate plotdata: aggregate total PM25 emission from all sources per year
## -----------------------------------------------------------------------------
plotdata <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot1.png', width=480, height=480)

## plot data
plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in the US 1999-2008",
     xlab = "Year", ylab = "Emissions")

## close device
dev.off()
##PLOT 2
# libraries
require(ggplot2)

## set work dir
setwd("C:/Users/mdragt/SkyDrive/Coursera/Exploring Data/Project2/")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
file = "summarySCC_PM25.rds"
NEI <- readRDS(file)

## -----------------------------------------------------------------------------
## elaborate plotdata: aggregate total PM25 emission from Baltimore per year
## -----------------------------------------------------------------------------
baltimore <- subset(NEI, fips == "24510")
plotdata <- aggregate(baltimore[c("Emissions")], list(year = baltimore$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot2.png', width=480, height=480)

## plot data
plot(plotdata$year, plotdata$Emissions, type = "l", 
     main = "Total PM2.5 Emission in Baltimore 1999-2008",
     xlab = "Year", ylab = "Emissions")

## close device
dev.off()
## PLOT 3
## libraries
require(ggplot2)

## set work dir
setwd("C:/Users/mdragt/SkyDrive/Coursera/Exploring Data/Project2/")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
file = "summarySCC_PM25.rds"
NEI <- readRDS(file)

## -----------------------------------------------------------------------------
## elaborate plotdata: aggregate total PM25 emission from Baltimore per year
## -----------------------------------------------------------------------------
baltimore <- subset(NEI, fips == "24510")
plotdata <- aggregate(baltimore[c("Emissions")], 
                      list(type=baltimore$type, year = baltimore$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot3.png', width=480, height=480)

## plot data
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  # fade out the points so you will see the line
  geom_point(alpha=0.1) +
  # use loess as there are many datapoints
  geom_smooth(method="loess") +
  ggtitle("Total PM2.5 Emissions in Baltimore per Type 1999-2008")
print(p)

## close device
dev.off()
PLOT 4
## libraries
require(ggplot2)

## set work dir
setwd("C:/Users/mdragt/SkyDrive/Coursera/Exploring Data/Project2/")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
# read national emission inventory data (NEI)
fileNEI = "summarySCC_PM25.rds"
NEI <- readRDS(fileNEI)

# read source classification codes (SCC)
fileSCC = "Source_Classification_Code.rds"
SCC <- readRDS(fileSCC)

## -----------------------------------------------------------------------------
## elaborate plotdata:  coal combustion-related sources emission for USA 
## agregated per year
## -----------------------------------------------------------------------------
# select the coal related sources, using Short.Name as EI.Sector exclude some
coalSource <- SCC[grepl("[Cc]oal", SCC$Short.Name),]

# select NEI data based on coal sources
coalNEI <- subset(NEI, NEI$SCC %in% coalSource$SCC)

# De-duplicate the data?
#coalNEI <- coalNEI[!duplicated(coalNEI),]

plotdata <- aggregate(coalNEI[c("Emissions")], 
                      list(year = coalNEI$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot4.png', width=480, height=480)

## plot data
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  # fade out the points so you will see the line
  geom_point(alpha=0.1) +
  # use loess as there are many datapoints
  geom_smooth(method="loess") +
  ggtitle("Total coal sourced Emission in the US 1999-2008")
print(p)

## close device
dev.off()
##PLOT 5
## libraries
require(ggplot2)

## set work dir
setwd("C:/Users/mdragt/SkyDrive/Coursera/Exploring Data/Project2/")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
# read national emission inventory data (NEI)
fileNEI = "summarySCC_PM25.rds"
NEI <- readRDS(fileNEI)

# read source classification codes (SCC)
fileSCC = "Source_Classification_Code.rds"
SCC <- readRDS(fileSCC)

## -----------------------------------------------------------------------------
## elaborate plotdata: aggregate total PM25 emission from Baltimore per year
## for motor vehicles
## -----------------------------------------------------------------------------
# get baltimore NEI data
baltimore <- subset(NEI, fips == "24510")

# get motor vehicle SCC
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]

# select baltimore data based on vehicle sources
vehicleBaltimore <- subset(baltimore, baltimore$SCC %in% vehicleSource$SCC)

# make plotdata
plotdata <- aggregate(vehicleBaltimore[c("Emissions")], 
                      list(type=vehicleBaltimore$type, 
                           year = vehicleBaltimore$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot5.png', width=480, height=480)

## plot data
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=type)) +
  # fade out the points so you will see the line
  geom_point(alpha=0.1) +
  # use loess as there are many datapoints
  geom_smooth(method="loess") +
  ggtitle("Total PM2.5 Emissions in Baltimore for Motor Vehicles 1999-2008")
print(p)

## close device
dev.off()
##PLOT 6
## libraries
require(ggplot2)

## set work dir
setwd("C:/Users/mdragt/SkyDrive/Coursera/Exploring Data/Project2/")

## -----------------------------------------------------------------------------
## get data
## -----------------------------------------------------------------------------
# read national emission inventory data (NEI)
fileNEI = "summarySCC_PM25.rds"
NEI <- readRDS(fileNEI)

# read source classification codes (SCC)
fileSCC = "Source_Classification_Code.rds"
SCC <- readRDS(fileSCC)

## -----------------------------------------------------------------------------
## elaborate plotdata: aggregate total PM25 emission from Baltimore 
## and Los Angeles per year for motor vehicles
## -----------------------------------------------------------------------------
# get Baltimore and Los Angeles NEI data
NEIBaLa <- subset(NEI, fips == "24510" | fips == "06037")

# get motor vehicle SCC
vehicleSource <- SCC[grepl("Vehicle", SCC$EI.Sector),]

# select baltimore data based on vehicle sources
vehicleBaLa <- subset(NEIBaLa, NEIBaLa$SCC %in% vehicleSource$SCC)

# assign the city name, based on fips code
vehicleBaLa$city <- rep(NA, nrow(vehicleBaLa))
vehicleBaLa[vehicleBaLa$fips == "06037", ][, "city"] <- "Los Angeles County"
vehicleBaLa[vehicleBaLa$fips == "24510", ][, "city"] <- "Baltimore City"


# make plotdata
plotdata <- aggregate(vehicleBaLa[c("Emissions")], 
                      list(city = vehicleBaLa$city, 
                           year = vehicleBaLa$year), sum)

## -----------------------------------------------------------------------------
## create plot
## -----------------------------------------------------------------------------
## create file
png('plot6.png', width=480, height=480)

## plot data
p <- ggplot(plotdata, aes(x=year, y=Emissions, colour=city)) +
  # fade out the points so you will see the line
  geom_point(alpha=0.1) +
  # use loess as there are many datapoints
  geom_smooth(method="loess") +
  ggtitle("PM2.5 Emissions in Baltimore and Los Angeles for Motor Vehicles")
print(p)

## close device
dev.off()
