library(shiny)
library(bslib)
source("R/ui.R")
source("R/server.R")

runExam <- function(inputFile, outputFile) {

  records <- NULL

  questions <- readLines(inputFile)

  shinyApp(ui = examUI(), server = examServer(questions, outputFile))
}
