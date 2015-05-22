## First check whether it has the file in the current dir.
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

library(dplyr)
library(ggplot2)

merged <- merge(NEI, SCC, by = "SCC")
dataVehicle <- merged[grepl("[Vv]ehicle", merged$SCC.Level.Two),]
Cities <-  filter(merged, fips == "24510" | fips=="06037")
byType <- group_by(Cities, fips, year)
sumsType <- summarize(byType, sum=sum(Emissions))
sumsType$fips <- factor(sumsType$fips, levels = c("24510", "06037"), labels = c("Baltimore", "Los Angeles"))

png(filename = "plot6.png", width = 720, height = 480)
ggplot(data=sumsType, aes(x=fips, y=sum, fill=factor(year))) + 
        geom_bar(colour="black", stat="identity",
                 position=position_dodge(), size=.3) + 
        xlab("Different areas") + ylab("Total Emissions") + # Set axis labels
        ggtitle("Total Emissions from Vehicles in Baltimore and in Los Angeles") +     # Set title
        theme_bw()
dev.off()