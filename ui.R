library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "COVID 19 Dataset - Projeto de estatística",
                  titleWidth = 650,
                  tags$li(class="dropdown", tags$a(href="https://github.com/FrederickAlmeida/projeto-estatistica", icon("github"), "Github do Projeto", target="_blank"))
  ),
  
  dashboardSidebar(
    sidebarMenu(id = "sidebar",
                menuItem("Dataset", tabName="data", icon=icon("database")),
                menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
                selectInput(inputId ="var1", label ="Select the variable" , choices =c1, selected="Total.Cases"),
                menuItem(text = "Choropleth Map", tabName = "map", icon = icon("map"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "data",
              tabBox(id="t1", width = 12,
                     tabPanel("About", icon=icon("address-card"),
                              fluidRow(column(width = 8, tags$img(src="covid.jpg", width=600, height=300),
                                              tags$br(),
                                              column(width=8, tags$br(),
                                                     tags$p("Dataset sobre o covid 19 coletado do kaggle, contém diversos dados sobre diferentes países em relação ao vírus."),
                                              )))),
                     tabPanel(title="Data", icon=icon("address-card"), dataTableOutput("dataT")),
                     tabPanel(title="Structure", icon=icon("address-card"), verbatimTextOutput("structure")),
                     tabPanel(title="Summary Stats", icon=icon("address-card"), verbatimTextOutput("summary"))
              )
      ),
      tabItem(tabName = "viz",
              tabBox(id="t2", width = 12,
                     tabPanel(title = "Total Cases by state", value = "trends", h4("tabpanel-1 placeholder UI")),
                     tabPanel(title = "Distribution", value = "distro", plotlyOutput("histplot")),
                     tabPanel(title = "Total cases/1M pop", value = "trends", h4("tabpanel-1 placeholder UI")),
                     tabPanel(title = "Deaths/1M pop", value = "trends", h4("tabpanel-1 placeholder UI"))
              )
      ),
      tabItem(tabName="map",
              box(h1("placeholder UI")))
    )
  )
)