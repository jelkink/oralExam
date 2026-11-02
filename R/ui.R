examUI <- function() {
  page_sidebar(
    title = "Oral Exam Manager",
    sidebar = sidebar(
      card(
        "Progress",
        textOutput("progress"),
        actionButton("back", "Back"),
        actionButton("forward", "Forward"),
        actionButton("end", "End")
      ),
      position = "right"
    ),
    card(
      card_header("Next question"),
      textOutput("question"),
      actionButton("nextQuestion", "Next")
    ),
    card(
      card_header("Feedback"),
      textInput("name", label = "Name", value = ""),
      textInput("id", label = "ID", value = ""),
      textInput("feedback", label = "Comments", value = "", width = "100%"),
      textInput("grade", label = "Grade", value = ""),
      actionButton("storeComments", "Submit")
    )
  )
}
