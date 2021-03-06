# Copyright 2018 Province of British Columbia
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and limitations under the License.


library(ggplot2)
library(viridis) # for colour palettes
library(scales) # for percentage axis label
library(leaflet)
library(plotly) # for interactive plots
library(DT) # for rendering data tables
library(shiny)


## Shiny user interface

ui <- navbarPage(HTML("<h4><b>Northern British Columbia Climate Research Stations</b></h4>"),

  tabPanel(HTML("<h4>Interactive Map</h4>"),
    # titlePanel("Northern British Columbia Climate Research Stations"),

    fluidRow(
      column(4, offset = 1, br(),
             leafletOutput("wsmap", height = "500px"),
             htmlOutput("statsum"),
             br(),
             selectInput(inputId = "selected_site",
                         label = "Download Station Data",
                         choices = c("All stations", levels(wxstn_df$Site))),
             downloadButton("download", "Download")
             # sliderInput(inputId = "timerange", label = "Time Range", min = wxstn_df$Date[1],
                         # max = wxstn_df$Date[nrow(wxstn_df)], value = c(wxstn_df$Date[1], wxstn_df$Date[nrow(wxstn_df)]))
      ),

      fluidRow(
        column(6, offset = -1,
               fluidRow(column(12, plotlyOutput("tempplot", height = "400px"))),
               fluidRow(column(12, plotlyOutput("precipplot", height = "400px"))),
               fluidRow(column(12, plotOutput("windplot", height = "300px"))),
               fluidRow(column(12, plotlyOutput("gustplot", height = "300px"))),
               fluidRow(column(12, plotlyOutput("solarplot", height = "300px")))
               )
        )
      )
    ),

  tabPanel(HTML("<h4>Statistics</h4>"),
    selectInput("sum_site",
                label = "Site",
                choices = c(levels(wxstn_df$Site))),

    selectInput("sum_tbl",
                label = "Summary type",
                choices = c("Annual", "Monthly", "Seasonal", "Growing season")),

    dataTableOutput("table")
    ),

  tabPanel(HTML("<h4>Real Time Data</h4>"),
    HTML("<a href='http://datagarrison.com/users/300234062103550/300234065020820/plots.php'><h4>Canoe Mountain Alpine</h4></a><br>"),
    HTML("<a href='http://datagarrison.com/users/300234062103550/300234064336030/plots.php'><h4>McBride Peak</h4></a><br>"),
    HTML("<a href='http://datagarrison.com/users/300234062103550/300234065500940/plots.php'><h4>Nonda Mountain</h4></a><br>"),
    HTML("<a href='http://datagarrison.com/users/300234062103550/300234065506710/plots.php'><h4>Pink Mountain Alpine</h4></a><br>"),
    HTML("<a href='https://datagarrison.com/users/300234062103550/300234065724550/plots.php'><h4>Hudson Bay Mountain Alpine</h4></a><br>")
    )
)
