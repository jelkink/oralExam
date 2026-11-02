examServer <- function(questions, outputFile) {
  function(input, output, session) {

    output$question <- renderText({
      sample(questions, 1, TRUE)
    }) |> bindEvent(input$nextQuestion)

    output$progress <- renderText({
      sprintf("Stored %d responses", nrow(records()))
    })

    records <- reactiveVal(data.frame(name = character(), id = character(),
                                      feedback = character(), grade = character()))

    pointer <- reactiveVal(1)

    observeEvent(input$storeComments, {

      if (!(input$name == "" && input$id == "")) {
        if (pointer() > nrow(records())) {
          records(rbind(records(), data.frame(
            name = input$name, id = input$id,
            feedback = input$feedback, grade = input$grade)))
        } else {
          rec <- records()
          rec$name[pointer()] <- input$name
          rec$id[pointer()] <- input$id
          rec$feedback[pointer()] <- input$feedback
          rec$grade[pointer()] <- input$grade
          records(rec)
        }

        write.csv(records(), outputFile, row.names = FALSE)

        pointer(nrow(records()) + 1)

        updateTextInput(session, "name", value = "")
        updateTextInput(session, "id", value = "")
        updateTextInput(session, "feedback", value = "")
        updateTextInput(session, "grade", value = "")
      }
    })

    scroll <- function() {
      if (pointer() <= nrow(records()) && pointer() > 0) {
        updateTextInput(session, "name", value = records()$name[pointer()])
        updateTextInput(session, "id", value = records()$id[pointer()])
        updateTextInput(session, "feedback", value = records()$feedback[pointer()])
        updateTextInput(session, "grade", value = records()$grade[pointer()])
      } else if (pointer() == nrow(records()) + 1) {
        updateTextInput(session, "name", value = "")
        updateTextInput(session, "id", value = "")
        updateTextInput(session, "feedback", value = "")
        updateTextInput(session, "grade", value = "")
      }
    }

    observeEvent(input$back, {

      if (pointer() > 1) pointer(pointer() - 1)

      scroll()
    })

    observeEvent(input$forward, {

      if (pointer() <= nrow(records())) pointer(pointer() + 1)

      scroll()
    })

    observeEvent(input$end, {

      pointer(nrow(records()) + 1)

      scroll()
    })
  }
}
