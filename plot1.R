## Data loading process
# check if data loaded,if not load it
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

sums <- tapply(NEI$Emissions, NEI$year, sum) # obtain the overall PM2.5 emissions for each year

# the PM2.5 emission trend is shown through a bar plot
png(filename = "plot1.png", width = 720, height = 480)
bar <- barplot(sums, col = "darkseagreen1", ylab = "Total PM2.5 Emissions", main = "Total PM2.5 Evolution over time in the US", xlab = "Year")
lines(bar, sums, col = "darkgreen", lwd = 2)
points(bar, sums, col = "darkgreen")
dev.off()
