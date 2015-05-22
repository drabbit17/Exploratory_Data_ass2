## First check whether it has the file in the current dir.
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

library(dplyr)

Baltimore <-  filter(NEI, fips == "24510")
sumsBalt <- tapply(Baltimore$Emissions, Baltimore$year, sum)
# the PM2.5 emission trend in Baltimore City is shown through a bar plot

png(filename = "plot2.png", width = 720, height = 480)
barBalt <- barplot(sumsBalt, col = "darkseagreen1", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Evolution over time in Baltimore", xlab = "Year")
lines(barBalt, sumsBalt, col = "darkgreen", lwd = 2)
points(barBalt, sumsBalt, col = "darkgreen")
dev.off()