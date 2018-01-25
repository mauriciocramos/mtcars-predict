# mtcars-predict

[Motor Trend Cars Prediction Shiny Application]()

This is a shiny(tm) web application with an R(tm) backend that predicts a car fuel consumption from a linear regression model of the mtcars dataset on predictors weight, 1/4 mile time and transmission mode.

You should set those 3 values in the side bar and push the submit button to get a new prediction and plot in the tab Prediction.

As you can expect, heavier, faster and automatic cars have shorter miles per gallon.
 
There are additional information in the tabs Model and Observed Data.

The tab Model summarizes the linear regression model used for prediction alongside with the coefficient's confidence interval and the variance-inflation factors.

The tab Observed Data lets you browse, sort and filter the mtcars dataset used to developed the linear regression model.