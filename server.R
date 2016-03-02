

library(shiny)
server.url <- "http://54.201.252.124:3838/"

shinyServer(function(input, output, session) {
    download.status <- 1
    observeEvent(input$download.pressed, {
        download.call <- paste("./download_from_git_local.sh", input$github.name, input$repo.name)
        #if(!is.na(input$dir.name)) download.call.string <- paste(download.call, input$dir.name)
        print(download.call)
        download.status <- system(download.call)
        output$console <- renderPrint({
            if(!download.status) {
                print("Download successful.")
                print("Your app is now available on the server.")
            } else {
                print("Something went wrong.")
                print("Please check your user and repo names.")
            }
        })
    })
    observeEvent(input$go.to.app, {
        browseURL(paste(server.url, input$appname, sep=""))
    })
})

