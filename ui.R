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
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'distro'", selectInput(inputId ="var1", label ="Select the variable" , choices =c1, selected="Total.Cases")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'trends' ", selectInput(inputId ="var2", label ="Select the variable" , choices =c1, selected="Total.Cases")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId ="var3", label ="Select the X variable" , choices =c1, selected="Total.Cases")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'relation' ", selectInput(inputId ="var4", label ="Select the Y variable" , choices =c1, selected="Total.Deaths")),
                conditionalPanel("input.sidebar == 'viz' && input.t2 == 'line' ", selectInput(inputId ="var5", label ="Select the variable" , choices =c1, selected="Total.Deaths"))
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
                     tabPanel(title = "Country Statics", value = "trends", plotlyOutput("bar")),
                     tabPanel(title = "Distribution", value = "distro", plotlyOutput("histplot")),
                     tabPanel(title = "Scatterplot", value = "relation", plotlyOutput("scatter")),
                     tabPanel(title = "Graphic Line", value = "line", plotlyOutput("graphicline"))
              )
      ),
      tabItem(tabName="map",
              box(h1("placeholder UI")))
    )
  )
)
