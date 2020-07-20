#For import
library(data.table)
#For graphs
library(ggplot2)

#For dealing with the data
#install.packages("forcats")
library(forcats)
library(tidyr)
library(dplyr)

#install.packages("ggthemes")
library(ggthemes)
library(plotly)

#FONTS
library(extrafont)
#font_import()
#loadfonts(device = "win")


library(shiny)
library(shinythemes)
#install.packages('rsconnect')
library(rsconnect)



#############
#IMPORTS: 
path <- "./data/odes.csv"
mydata <- fread(path, header=TRUE, sep = '^', stringsAsFactors = TRUE, encoding='UTF-8')
#View(mydata)

#We re-order the factor
mydata$Collection <- ordered(mydata$Collection, levels = c('Epodes', 'Odes I', 'Odes II', 'Odes III', 'Carmen', 'Odes IV'))
mydata$Meter <- ordered(mydata$Meter, levels = c("alcaic strophe",                                       
                                                 "iambic strophe","iambic trimeter", "trochaic strophe",
                                                 "alcmanic strophe", "first pythiambic",          "second pythiambic",  "first archilochean"  ,  "second archilochean",   "third archilochean",  "fourth archilochean", 
                                                 "first asclepiadean","second asclepiadean", "third asclepiadean",  "fourth asclepiadean",    "fifth asclepiadean",  
                                                 "ionic a minore", "sapphic strophe", "second sapphic strophe" ))

colors <- c("alcaic strophe" = 'tomato',                                       
            "iambic strophe" = 'tan1',
            "iambic trimeter" = 'tan2', 
            "trochaic strophe"= 'orange', 
            "alcmanic strophe"= 'gold1', 
            "first pythiambic"= 'gold2', 
            "second pythiambic"= 'gold3', 
            "first archilochean"= 'seagreen1', 
            "second archilochean"= 'seagreen2', 
            "third archilochean"= 'seagreen3', 
            "fourth archilochean"= 'seagreen4', 
            "first asclepiadean"= 'dodgerblue1', 
            "second asclepiadean"= 'dodgerblue2', 
            "third asclepiadean"= 'dodgerblue3', 
            "fourth asclepiadean"= 'dodgerblue4', 
            "fifth asclepiadean"= 'slateblue1', 
            "ionic a minore"= 'slateblue2', 
            "sapphic strophe"= 'slateblue3', 
            "second sapphic strophe"= 'slateblue4')

server <-  function(input, output) {
  
  mydata <- mydata
  
  p<-ggplot(data=mydata, aes(x=Collection, y=Lines)) +
    geom_bar(stat="identity", fill = 'slateblue3') +
    theme(axis.text.x = element_text(angle = 45)) +
    labs(title="Bar Chart of Total Lines Written in each Collection of Poetry, by Release Date", x ="Poetry Collection", y = "Number of Lines in each Collection")
  
  
  q<-ggplot(data=mydata, aes(x=reorder(Collection, -Lines, sum), y=Lines)) +
    geom_bar(stat="identity", fill = 'slateblue3') +
    theme(axis.text.x = element_text(angle = 45)) +
    labs(title="Bar Chart of Total Lines Written in each Collection of Poetry, arranged by Volume", y = "Number of Lines in each Collection")
  
  
  #By sum of lines
  r<-ggplot(data=mydata, aes(x=reorder(Meter, -Lines, sum), y=Lines)) +
    geom_bar(stat="identity", fill = 'slateblue3') +
    theme(axis.text.x = element_text(angle = 45)) +
    labs(title="Bar Chart of Total Lines Written in each Meter", x ="Meter", y = "Number of Lines in each Meter")
  
  
  #By frequency per poem
  s<-ggplot(data=mydata, aes(x=forcats::fct_infreq(Meter))) +
    geom_bar(stat="count", fill = 'slateblue3') + 
    theme(axis.text.x = element_text(angle = 45)) +
    labs(title="Bar Chart of Frequency of Meters Used in Poems", x ="Meter", y = "Number of Poems per Meter")
  
  w <- ggplot(mydata, aes(y=Lines, x=Collection, fill=Meter)) + 
    geom_bar(position="stack", stat="identity") + 
    scale_fill_manual(values = colors) +
    theme(text=element_text(size=16,  family="Verdana")) +
    labs(title="Bar Chart of Total Lines Written in each Collection of Poetry, Color Coded by Meter", x='Poetry Collection')
  
}

