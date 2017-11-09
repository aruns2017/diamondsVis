#user interface and create a server 
library(shiny)
library(ggplot2)

#user interface, download shiny interactive cheat sheet 
ui = fluidPage (
#first focus on the gui 
  titlePanel("Diamonds Data", windowTitle = "Diamonds"),
  sidebarLayout(
    sidebarPanel( 
      helpText("This app is to visualize diamonds dataset"),
      textInput(inputId = "title", label = "Chart Title", value = ""), # if there is anything that we need to interact with then we use an input title 
      selectInput(inputId = "pos", 
                  label = "Position", 
                  choices = list("stack", "dodge"),
                  selected = "stack")
      ), 
    mainPanel(
      plotOutput(outputId = "plot")
    ) # we want to display a plot - dataTableOutput, we also want to give it an id because we want to link two objects together 
    )#all these are arguments to the function 
)

#access widget gallery in shiny to see the code - can directly use the code from here 
#also whichever shiny apps that you want to use - pick Shiny online 

#when you resize it the content is going to adapt to that particular window, each argument is
#going to be a widget 

#make sure to exit the command otherwise it will keep listening, make sure to look at shiny cheat sheet
#important to get code

#Server 
server = function (input, output) {
  output$plot = renderPlot(
  ggplot(diamonds, aes(x = cut, fill = clarity)) + 
    geom_bar(position = input$pos) + 
    ggtitle(input$title)  #linking the title 
  )#the server created the plot but didn't send us back the plot, need to render it and then tell it where to show it 
}

#important to remember what is input and what is output think about having two boxes. THe first box is input - which contains title and pos, output is just the plot 

shinyApp(ui, server)

#always close the window before we run any other code again 

#shiny.rstudio.com/gallery/
#click on get started video 
#customize the appearance 

#Lab 2 for today 



