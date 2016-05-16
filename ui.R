library(shiny)
library(shinyBS)
library(shinythemes)

shinyUI(fixedPage(theme = shinytheme("spacelab"), responsive=FALSE,

    tags$head(includeScript("google-analytics.js")),
    h1(imageOutput("logo", height=80)),
    titlePanel("Shiny Server"),
    tabsetPanel(
        tabPanel("App Directory",
            fixedRow(
                column(6, (dataTableOutput("app.table")))
                )),
        tabPanel("App Gallery",
             fixedRow(
                 column(6, h3("Drought Awareness"), uiOutput("thumbnail1"),
                        bsPopover("thumbnail1", "Climate Action Workshop: Drought Awareness in California. Explore drought awareness, drought index, and water use in California.")),
                 column(6, h3("Sampling Distribution Visualization"), uiOutput("thumbnail2"),
                        bsPopover("thumbnail2", "Simulate and visualize sampling distributions for different populations."))
             )),
        tabPanel("Deploy to Server",
             fixedRow(
                 column(7,
                    h3("Download from Github"),
                     textInput("github.name", "Enter Github username (required):"),
                     textInput("repo.name", "Enter repo name (required):"),
                     textInput("dir.name", "Enter subdirectory name (optional):"),
                     actionButton("download.pressed", "Download"),
                     verbatimTextOutput("console")
                ),
                column(7,
                    includeMarkdown("deployment_guide.md")
                )
            )
        ),
        tabPanel("FAQ",
            fixedRow(
                column(6,
                     includeMarkdown("FAQ.md"))
            )
        ),
        tabPanel("Support",
            fixedRow(

            )
        )
    )
))
