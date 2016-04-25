library(shiny)
server.url <- "http://shiny.datascience.uci.edu:80/"
#app.directory <- "/home/dp/UCI/DSI/shiny_apps/"
app.directory <- "/home/shiny/"
download.script <- "./download_from_git.sh"


create.link <- function(app.name, user.name=NULL) {
    print(app.name, user.name)
    if(is.null(user.name))
        return(sprintf('<a href="%s%s" target="_blank" class="btn btn-primary">%s</a>', server.url, app.name, app.name))
    else
        return(sprintf('<a href="%s%s/%s" target="_blank" class="btn btn-primary">%s</a>', server.url, user.name, app.name, app.name))
}

shinyServer(function(input, output, session) {
    # Header logo
    output$logo <- renderImage({
        return(list(
            src="data_science_logo.png",
            filetype="image/png"
        ))
    }, deleteFile=FALSE)

    # Code for app navigation
    app.list <- sapply(strsplit(system2("find", args=c(paste(app.directory, "-maxdepth 2 -type d -exec ls -d '{}' \\;")),
                        stdout=TRUE, stderr=TRUE), app.directory), function(x) x[2])[-1]
    app.list <- app.list[!grepl("\\/\\.", app.list) & (!grepl("^\\.", app.list))]
    app.list <- app.list[which(app.list!="server")]
    app.list <- c(app.list[grepl("UCI", app.list)], app.list[!grepl("UCI", app.list)])
    output$app.table <- renderDataTable({cbind("Apps"=create.link(app.list))}, escape=FALSE)

    # Code for deploying apps
    observeEvent(input$download.pressed, {
        download.call <- paste(download.script, input$github.name, input$repo.name)
        if(!is.na(input$dir.name)) download.call.string <- paste(download.call, input$dir.name)
        download.status <- system2(download.script,
                                   args=c(input$github.name, input$repo.name),
                                   stdout=TRUE, stderr=TRUE)
        output$console <- renderPrint({
            download.status
        })
    })
})
