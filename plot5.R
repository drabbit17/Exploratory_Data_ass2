## First check whether it has the file in the current dir.
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

merged <- merge(NEI, SCC, by = "SCC")
dataVehicle <- merged[grepl("[Vv]ehicle", merged$SCC.Level.Two),]
sumsVehicle <- tapply(dataVehicle$Emissions, dataVehicle$year, sum)

png(filename = "plot5.png", width = 720, height = 480)
barVehicle <- barplot(sumsVehicle, col = "darkseagreen1", ylab = "Total PM2.5 Emissions from Coal", main = "Total PM2.5 Emissions from Coal in the US", xlab = "Year")
lines(barVehicle, sumsVehicle, col = "darkgreen", lwd = 2)
points(barVehicle, sumsVehicle, col = "darkgreen")
dev.off()

