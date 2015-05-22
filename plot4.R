## First check whether it has the file in the current dir.
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

merged <- merge(NEI, SCC, by = "SCC")
dataCoal <- merged[grepl("[Cc]oal", merged$EI.Sector),]
sumsCoal <- tapply(dataCoal$Emissions, dataCoal$year, sum)

png(filename = "plot4.png", width = 720, height = 480)
barCoal <- barplot(sumsCoal, col = "darkseagreen1", ylab = "Total PM2.5 Emissions from Coal", main = "Total PM2.5 Emissions from Coal in the US", xlab = "Year")
lines(barCoal, sumsCoal, col = "darkgreen", lwd = 2)
points(barCoal, sumsCoal, col = "darkgreen")
dev.off()