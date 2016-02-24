

library(shiny)

shinyServer(function(input, output, session) {
    applist <- read.delim("applist", sep="\n", header=FALSE)

    updateSelectizeInput(session, 'x1', choices = list(
        Apps = setNames(applist, applist)
    ), selected = 'Select App')

    observeEvent(input$upload.pressed, {
        print(input$github.name)
    })
})

