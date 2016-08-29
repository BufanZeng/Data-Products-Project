library(shiny)
library(ggplot2)
library(plotly)
source("helper.R")
shinyUI(fluidPage(
  titlePanel("Elasticity Calculator"),
  
  sidebarLayout(
    sidebarPanel(
      
      numericInput("P1", "Enter first price point", 0),
      numericInput("P2", "Enter second price point", 0),
      numericInput("P3", "Enter third price point", 0),
      numericInput("P4", "Enter forth price point", 0),
      numericInput("P5", "Enter fifth price point", 0),
      checkboxGroupInput("checkGroup", label = "Pick the brands you want to include", 
                         choices = list("Brand1" = 1, "Brand2" = 2, "Brand3" = 3,"Brand4" = 4,"Brand5" = 5,"Brand6" = 6,"Brand7" = 7,"Brand8" = 8),
                         selected = c(1:8)),
      selectInput("view","Select the brand to view", c("Brand1","Brand2","Brand3","Brand4","Brand5","Brand6","Brand7","Brand8"),selected = "OH", selectize = TRUE, multiple = FALSE),
      fileInput('file1', 'Choose file to upload',
                accept = c(
                  'text/csv',
                  'text/comma-separated-values',
                  'text/tab-separated-values',
                  'text/plain',
                  '.csv',
                  '.tsv'
                )
      )
),
    mainPanel( 
      plotlyOutput("eplot"),
      tags$hr(),
      p('This app helps calculate the piecewise-elasticities of the utility data at five price points and plot them.',
        'Coming from the marketing research, the utility data measures the preference of certain products.',
        'The data file can contail up to 8 brands.'),
      p('If you want a sample .csv file to upload,',
        'you can first download the sample',
        a(href = 'https://github.com/BufanZeng/Data-Products-Project/blob/master/simed%20data_utilities.csv', 'simed data_utilities.csv'),
        'files, and then try uploading. (If you use this sample csv, try price levels between 100 to 200'
      )
    )
    
    
  )
))