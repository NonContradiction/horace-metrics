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


ui <- fluidPage(
  titlePanel("Bar Chart Analysis of Horace's Meters: Carpe Diem"),
  
  fluidRow(
    column(width = 9,
           tabsetPanel(
             tabPanel(title = 'Lines per Collection, by date', 
                      
                      ggplotly(p)
             ),
             tabPanel(title = 'Lines per Collections, by size', 
                      
                      ggplotly(q)
             ),
             tabPanel(title = 'Lines per Meter', 
                      
                      ggplotly(r)
             ),
             tabPanel(title = 'Poems per Meter', 
                      
                      ggplotly(s)
             ),
             tabPanel(title = 'Lines per Meter per Collection', 
                      ggplotly(w, height = 770)
                      
             )
             
           )
    )
  )
)