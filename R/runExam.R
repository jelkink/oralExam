#' @import shiny bslib
#' @export runExam

runExam <- function(inputFile, outputFolder) {

  questions <- readLines(inputFile)

  shinyApp(ui = examUI(), server = examServer(questions, outputFolder))
}
