## First check whether it has the file in the current dir.
if (!"NEI" %in% ls() | !"SCC" %in% ls()) {
        setwd("~/data/R/coursera/Exploratory_data/ass2")
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")
}

library(dplyr)
library(ggplot2)

Baltimore <-  filter(NEI, fips == "24510")
byType <- group_by(Baltimore, type, year)
sumsType <- summarize(byType, sum=sum(Emissions))

png(filename = "plot3.png", width = 720, height = 480)
ggplot(data=sumsType, aes(x=type, y=sum, fill=factor(year))) + 
        geom_bar(colour="black", stat="identity",
                position=position_dodge(), size=.3) + 
               xlab("Type of Source") + ylab("Total Emissions") + # Set axis labels
               ggtitle("Total Emissions from Different Sources in Baltimore") +     # Set title
               theme_bw()
dev.off()
