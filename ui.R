

library(shiny)

shinyUI(fluidPage(sidebarLayout(
    titlePanel("UCI DSI Shiny Server"),
    fluidRow(
        column(5, wellPanel(
            h2("Select App")
        )),
        column(5, wellPanel(
            h2("Upload to Github"),
            textInput("github.name", "Enter Github name."),
            textInput("repo.name", "Enter repo name."),
            actionButton("upload.pressed", "Upload")
        )))),
    title = 'Options groups for select(ize) input'))

