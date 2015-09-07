library(shiny)

shinyUI(fluidPage(
  titlePanel("Basic Widgets"),
  
  fluidRow(
    
    column(3,
           h3("Buttons"),
           actionButton("action", "Action"),
           br(),
           br(),
           submitButton("Submit")),
    
    column(3,
           h3("Single Checkbox"),
           checkboxInput("CheckBox", label = "Choice A", value = FALSE)),
    
    column(3,
           h3("CheckGroup"),
           checkboxGroupInput("CheckGroup",
                              label = h3("Checkbox Group"),
                              choices = list("Choice 1" = 1,
                                             "Choice 2" = 2,
                                             "Choice 3" = 3))),
    
    column(3,
           dateInput("Date",
                     label = h3("Date Input"),
                     value = "2014-01-01"))
  ),
  
  fluidRow(
    
    column(3,
           radioButtons("Radio",
                        label = h3("Radio Buttons"),
                        choices = list("Choice 1" = 1,
                                       "Choice 2" = 2,
                                       "Choice 3" = 3),
                        selected = 1)),
    
    column(3,
           selectInput("Select",
                       label = h3("Select Box"),
                       choices = list("Choice 1" = 1,
                                      "Choice 2" = 2,
                                      "Choice 3" = 3),
                       selected = 1)),
    
    column(3,
           sliderInput("Slider1",
                       label = h3("Sliders"),
                       min = 0, max = 100, value = 50),
           sliderInput("Slider2",
                       label = "",
                       min = 0, max = 100, value = c(25, 75))
           ),
    
    column(3,
           textInput("Text",
                     label = h3("Text Input"),
                     value = "Enter text...")
           )
  )
))
