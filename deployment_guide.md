---
title: "deployment_guide"
output: html_document
---

### Server Deployment Guide

1. In order to deploy your Shiny apps to the UCI server, the app source code 
must be hosted on GitHub.  Simply enter your GitHub username and the app repository 
name and click the download button.
2. Any changes to the app can be made by updating the GitHub source and repeating the 
download steps.  The previous version of the app will be automatically overwritten. After downloading, your app should be immediately available at shiny.datascience.uci.edu/*username/reponame*.  
3. If your app is unavailable due to a missing package, please contact the server administrator 
to request that the package be added to the server.  Note that only packages currently 
available on CRAN can be added to the server.  Some CRAN packages may not usable on 
the server due to software compatibility issues, please contact a DSI Shiny 
support member for help with ensuring your app will work on the server.
