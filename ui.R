library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "COVID 19 Dataset - Projedo de estatística",
                  titleWidth = 650,
                  tags$li(class="dropdown", tags$a(href="https://github.com/FrederickAlmeida/projeto-estatistica", icon("github do projeto"), "Github do Projeto", target="_blank"))
                  ),
  
  dashboardSidebar(
    sidebarMenu(id = "sidebar",
      menuItem("Dataset", tabName="data", icon=icon("database")),
      menuItem(text = "Visualization", tabName = "viz", icon = icon("chart-line")),
      menuItem(text = "Choropleth Map", tabName = "map", icon = icon("map"))
    )
  ),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "data",
              tabBox(id="t1", width = 12,
                     tabPanel("About", icon=icon("address-card"), h4("tabpanel 1 placeholder")),
                     tabPanel(title="Data", icon=icon("address-card"), h2("tabpanel-2 placeholder UI")),
                     tabPanel(title="Structure", icon=icon("address-card"), h2("tabpanel-3 placeholder UI")),
                     tabPanel(title="Summary Stats", icon=icon("address-card"), h2("tabpanel-4 placeholder UI"))
                     )
              ),
      tabItem(tabName = "viz",
              tabBox(id="t2", width = 12,
                    tabPanel(title = "Total Cases by state", value = "trends", h4("tabpanel-1 placeholder UI")),
                    tabPanel(title = "Total deaths by state", value = "distro", h4("tabpanel-2 placeholder UI")),
                    tabPanel(title = "Total cases/1M pop", value = "trends", h4("tabpanel-1 placeholder UI")),
                    tabPanel(title = "Deaths/1M pop", value = "trends", h4("tabpanel-1 placeholder UI"))
                    )
              )
    )
  )
)