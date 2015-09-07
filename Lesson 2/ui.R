library(shiny)

src_img <- "/Users/jramirezcastillo/Documents/bigorb.png"

shinyUI(fluidPage(
  titlePanel(h1(strong("My Shiny App"))),
  br(),
  
  sidebarLayout(
    sidebarPanel(h3(strong("Installation")),
                 p("Shiny is available on CRAN, so you can install it in 
                   the usual way from your R console:"), 
                 br(),
                 br(),
                 code('install.packages("shiny")'),
                 br(),
                 br(),
                 br(),
                 br(),
                 p(img(source = src_img, 
                       height = 72, width = 72),
                   "shiny is a product of", a("RStudio", 
                                              href ="http://www.rstudio.com"),
                   align = "bottom")),
    mainPanel(h1(strong("Introducing Shiny")),
              br(),
              p("Shiny is a new package from RStudio that makes it",
                em("incredibly easy"), "to build interactive web applications
                with R."),
              br(),
              br(),
              p("For an introduction and live examples, visit the",
                a("Shiny homepage.", href = "http://www.rstudio.com/shiny")),
              br(),
              h1(strong("Features")),
              p("* Build useful web applications with only a few lines of
                code - no JavaScript required."),
              p('* Shiny applications are automatically "live" in the same
                way that', strong("spreadsheets"), "are live. Outputs 
                change instantly as user modify inputs, without
                requiring a reload of the browser."))
  )
))