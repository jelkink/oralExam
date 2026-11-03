# oralExam

This is a [Shiny](https://shiny.posit.co) based simple user interface in R to manage an oral exam. Given a battery of open questions, the UI will randomly present questions, and allow the user to enter information about the student, their feedback, and the grade. Questions are selected with replacement, so can be repeated. Back-and-forth buttons help to make modifications and compare evaluations between different students.

## Installation

```
devtools::install_github("jelkink/oralExam")
```

## Usage

Assuming a simple text file where each line contains a question:

```
library(oralExam)

runExam("questions.txt", "~/exam_results/")
```

Results are tracked in *date*_scores.csv, which will be saved in the output folder.
