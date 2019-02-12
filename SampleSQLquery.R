# install.packages("sqldf")
# install.packages("RMySQL",type="source")
# install.packages("plumber")
# install.packages("ggplot2")
# 
# 
# 
library(dplyr)
library(dbplyr)
library(RMySQL)
library(plumber)
library(ggplot2)
library(shiny)


#working
#Linux
con <- dbConnect(RMySQL::MySQL(), host = "localhost",dbname="lgu_paeis_db",user = "root",unix.sock="/opt/lampp/var/mysql/mysql.sock")
#Windows
#con <- dbConnect(RMySQL::MySQL(), host = "localhost",dbname="lgu_paeis_db",user = "root",unix.sock="/MysteryUnsolved/mysql.sock")

#current working line
dat <-dbGetQuery(con, 'SELECT YEAR(OR_DATE) AS YEARS, SUM(OR_TOTAL_AMOUNT) AS TOTAL_REVENUE from bpls_t_official_receipt GROUP BY YEAR(OR_DATE) ORDER BY SUM(OR_TOTAL_AMOUNT) DESC')
xdat <- as.data.frame.matrix(dat) 

dbDisconnect(con)


#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg=""){
  list(msg = paste0("The message is: '", msg, "''",xdat,"'"))
}

#* Plot a histogram
#* @png
#* @get /plot
function(){
  # rand <- rnorm(100)
  # hist(rand)
  # plot(dat)
  printDB <- ggplot(data=xdat, aes(x="Year", y="Total (PHP)",shape = factor(xdat))) +
    geom_point(aes(colour = factor(xdat)), size = 4) +
    geom_point(colour = "grey90", size = 1.5)
  print(printDB)
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b){
  as.numeric(a) + as.numeric(b)
}


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}


shinyApp(ui = ui, server = server)