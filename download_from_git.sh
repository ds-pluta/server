#!/bin/bash

USER=$1
REPO=$2
DIR=$3

OVERWRITE=true

APP_ROOT=/home/shiny

## Verify input and download github repo.
if [ -z $USER ]
then
    echo "Github username required."
    exit 1
elif [ -z $REPO ]
then
    echo "Repository name required."
    exit 2
elif [ -z $DIR ]
then
    echo "Downloading from $USER/$REPO"
    git clone https://github.com/$USER/$REPO.git
else
    echo "Downloading from $USER/$REPO/$DIR"
    git clone git@github.com:$USER/$REPO/$DIR.git
fi

## Check if USER/REPO directory exists on server.
##   IF it exists, overwrite it with downloaded folder if OVERWRITE is true.
##   ELSE make USER directory and move downloaded repo there.
#### TODO modify to account for downloading a repo subdirectory.
if [ -d $APP_ROOT/$USER/$REPO ]
then
    echo "Overwriting $USER/$REPO."
    rm -r $APP_ROOT/$USER/$REPO
elif [ -d $APP_ROOT/$USER ]
then
    echo "User directory exists, downloading $REPO into $USER."
else
    echo "Creating $USER directory and downloading $REPO."
    mkdir -p $APP_ROOT/$USER
fi
mv $REPO $APP_ROOT/$USER

