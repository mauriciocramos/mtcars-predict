library(shiny)

shinyUI(fluidPage(
  titlePanel("Predict fuel consumption from car characteristics"),
  sidebarLayout(
    sidebarPanel(
      "Please set the 3 variables with which to predict and push the submit button, otherwise check the documentation tab.", p(),
      sliderInput("sliderWt", "Weight (1000 lbs)?",
                  min(mtcars$wt), max(mtcars$wt),
                  value = round(mean(mtcars$wt)), step = .1),
      sliderInput("sliderQsec", "1/4 mile time?",
                  min(mtcars$qsec), max(mtcars$qsec),
                  value = round(mean(mtcars$qsec)), step = .1),
      selectInput("selectAm", "Transmission mode?", c("Automatic"="0","Manual"="1")),
      submitButton("Submit")
    ),
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Prediction",
                           plotOutput("plot2"),
                           h3("Predicted miles per gallon:"),
                           textOutput("pred1")), 
                  tabPanel("Model", "Summary:", br(),
                           verbatimTextOutput("summary1"),
                           "Confidence Interval:", br(),
                           verbatimTextOutput("confint1"),
                           "Variance-inflation factors:", br(),
                           verbatimTextOutput("vif1")),
                  tabPanel("Observed data", br(),
                           dataTableOutput("data1")),
                  tabPanel("Documentation", br(),
                           "This is a shiny(tm) web application with an R(tm) backend that predicts a car fuel consumption from a linear regression model of the mtcars dataset on predictors weight, 1/4 mile time and transmission mode.",p(),
                           "You should set those 3 values in the side bar and push the submit button to get a new prediction and plot in the tab Prediction.",p(),
                           "As you can expect, heavier, faster and automatic cars have shorter miles per gallon.",p(),
                           "There are additional information in the tabs Model and Observed Data.",p(),
                           "The tab Model summarizes the linear regression model used for prediction alongside with the coefficient's confidence interval and the variance-inflation factors.",p(),
                           "The tab Observed Data lets you browse, sort and filter the mtcars dataset used to developed the linear regression model."
                           )
      )
    )
  )
))
