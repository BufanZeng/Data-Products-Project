library(shiny)
library(ggplot2)
library(plotly)
source("helper.R")
options(shiny.maxRequestSize = 9*1024^2)

shinyServer(function(input, output) {
    contents <- reactive({
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header = TRUE,
             sep = ',', quote = input$quote)
  })
       selected<-reactive({
         as.numeric(as.vector(input$checkGroup))
         })
       view<-renderText(input$view)
       
       
       output$eplot<-renderPlotly({
         if (is.null(input$file1))
           return(NULL)
         sop<-myfun(contents(),view(),selected())
         price<-c(input$P1,input$P2,input$P3,input$P4,input$P5)
         df<-data.frame(cbind(price,sop))
         x<-log(price)
         y<-log(sop)
         fit<-lm(y~x)
         Elasticity<-round(fit$coefficients[2],2)
        g<- ggplot(data=df,aes(price,sop)) + geom_line(colour="lightblue",size=2)+ geom_point(color="steelblue",size=4)+ylab("Share of Preference (%)") + ggtitle(paste("Elasticity = ",as.character(Elasticity)))
        p<-ggplotly(g)
        p
 
        })
})
