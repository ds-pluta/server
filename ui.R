library(shiny)

shinyUI(fluidPage(
    h1(imageOutput("logo", height=80)),
    titlePanel("Shiny Server"),
    tabsetPanel(
        tabPanel("App Directory",
            fluidRow(
                column(6, (dataTableOutput("app.table")))
            )),
        tabPanel("Deploy to Server",
             fluidRow(
                 column(4,
                    h3("Download from Github"),
                     textInput("github.name", "Enter Github username (required):"),
                     textInput("repo.name", "Enter repo name (required):"),
                     textInput("dir.name", "Enter subdirectory name (optional):"),
                     actionButton("download.pressed", "Download"),
                     verbatimTextOutput("console")
                )
            )
        )
    )
))
