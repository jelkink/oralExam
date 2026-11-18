examUI <- function() {
  page_sidebar(
    title = "Oral Exam Manager",
    tags$head(tags$style(HTML("
      .exam-clock {
        position: fixed;
        bottom: 16px;
        right: 16px;
        z-index: 1000;
        padding: 0.25rem 0.75rem;
        border-radius: 0.5rem;
        background: rgba(255, 255, 255, 0.92);
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.25);
        font-family: monospace;
        font-size: 4rem;
        font-weight: 700;
        font-variant-numeric: tabular-nums;
        line-height: 1.1;
      }
    "))),
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
    ),
    uiOutput("clock")
  )
}
