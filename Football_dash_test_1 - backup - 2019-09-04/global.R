# Load required libraries.
library(dplyr)
library(ggplot2)
library(leaflet)
library(lubridate)
library(shiny)
library(shinythemes)
library(stringr)
library(tidyverse)
library(StatsBombR)
library(soccermatics)
library(shinydashboard)
library(shinyWidgets)

source(file = "plot_scripts.R")
data("statsbomb")

# Random javascript code that allows dynamic resizing of the map.
jscode <- '$(document).on("shiny:connected", function(e) {
        var jsHeight = window.innerHeight;
        Shiny.onInputChange("GetScreenHeight",jsHeight);
});'
