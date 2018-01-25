library(shiny)
library(car)
library(ggplot2)
mtcars <- cbind(model = rownames(mtcars), mtcars)
mtcars$am <- factor(mtcars$am)
model1 <- lm(mpg ~ wt + qsec + am, data = mtcars)

shinyServer(function(input, output) {
   
  model1pred <- reactive({
    predict(model1, newdata = data.frame(wt = input$sliderWt,
                                         qsec = input$sliderQsec,
                                         am = input$selectAm))
  })
  output$plot2 <- renderPlot({
    ggplot(mtcars, aes(x=wt, y=mpg, size=qsec, color=factor(am,labels=c("auto","manual")))) +
      labs(x="Weight (1000 lbs)", y="Miles Per Gallon", color='transmission', size="1/4 mile time") +
      geom_point(alpha=0.1) + theme_minimal() +
      geom_smooth(size=1, method = lm, alpha=0.1, se = FALSE) +
      geom_point(aes(x=input$sliderWt, y=model1pred(), size=input$sliderQsec+.5),
                 shape=19, color=1)
  })
  output$pred1 <- renderText({
    model1pred()
  })
  
  output$summary1 <- renderPrint({
    summary(model1)
  })
  
  output$confint1 <- renderPrint({
    confint(model1)
  })
  
  output$vif1 <- renderPrint({
    vif(model1)
  })
  
  output$data1 <- renderDataTable(mtcars, options=list(pageLength=nrow(mtcars)))
  
})
