library(shiny); library(maps); library(mapproj)

# When using outside files, ALWAYS declare the FULL DIRECTION in your local
# machine

a <- "/Users/jramirezcastillo/GitHub/Shiny_Test"
b <- "/Lesson\ 5/Data/counties.rds"
d <- "/Lesson\ 5/helpers.R"
c <- paste(a, b, sep = "")
e <- paste(a, d, sep = "")
source(e)
counties <- readRDS(c)
rm(a,b,c,d,e)

# Create a map
# percent_map(counties$white, "darkgreen", "% white")

shinyServer(function(input, output) {
  
  output$map <- renderPlot({
    args <- switch(input$var,
                   "Percent White" = list(counties$white, "red", "% White"),
                   "Percent Black" = list(counties$black, "green",
                                          "% Black"),
                   "Percent Hispanic" = list(counties$hispanic, "blue",
                                             "% Hispanic"),
                   "Percent Asian" = list(counties$asian, "yellow", 
                                          "% Asian"))
    args$min <- input$range[1]
    args$max <- input$range[2]
    
    do.call(percent_map, args)
  })
  
})

# When running an app from Shiny, the app name is the folder that contains
# the server.R and ui.R files.