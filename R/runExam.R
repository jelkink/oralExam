#' @import shiny bslib
#' @export runExam

runExam <- function(inputFile, outputFile) {

  questions <- readLines(inputFile)

  shinyApp(ui = examUI(), server = examServer(questions, outputFile))
}
