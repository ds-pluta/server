

library(shiny)

shinyUI(fluidPage(
    h1("UCI DSI Shiny Server"),
    h2("Navigate to App"),
    fluidRow(
        column(6, offset=0.5, wellPanel(
            selectInput("appname", "Select App",
                        choices=c("sampling", "test")),
            actionButton("go.to.app", "Go")
        ))),
    h2("Deploy to Server"),
    fluidRow(
        column(6, offset=0.5, wellPanel(
            h3("Download from Github"),
            textInput("github.name", "Enter Github name:"),
            textInput("repo.name", "Enter repo name:"),
            #,
            #textInput("dir.name", "Enter directory name:")
            #,
            #fileInput("app", label = h3("Select Application File (.zip)"))
            actionButton("download.pressed", "Download")
        ))),
    fluidRow(
        column(6, offset=0.5,
               verbatimTextOutput("console")
        ))
    ))

