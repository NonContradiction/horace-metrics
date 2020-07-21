#For import
library(data.table)
#For graphs
library(ggplot2)
library(ggthemes)
library(plotly)

#For dealing with the data
library(forcats)
library(tidyr)
library(dplyr)

#FONTS
library(extrafont)

#For the app: 
library(shiny)
library(shinythemes)
library(rsconnect)

ui <- fluidPage(
  titlePanel("Bar Chart Analysis of Horace's Meters: Carpe Diem"),
  
  fluidRow(
    column(width = 12,
           tabsetPanel(
             tabPanel(title = 'Lines by Collection, by date', 
                      
                      ggplotly(barfirst)
             ),
             tabPanel(title = 'Lines by Collections, by size', 
                      
                      ggplotly(barsecond)
             ),
             tabPanel(title = 'Lines by Meter', 
                      
                      ggplotly(barthird)
             ),
             tabPanel(title = 'Poems by Meter', 
                      
                      ggplotly(barfourth)
             ),
             tabPanel(title = 'Boxplot of Lengths by Collection', 
                      
                      ggplotly(boxfirst, height = 783)
             ),
             tabPanel(title = 'Boxplot of Lengths by Collection, Meters Colored in', 
                      
                      ggplotly(boxsecond, height = 783)
             ),
             tabPanel(title = 'Lines by Meter by Collection', 
                      
                      ggplotly(stackedbar, height = 783)
             )
             
           )
    )
  )
)
