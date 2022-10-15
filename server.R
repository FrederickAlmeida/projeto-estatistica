library(DT)
function(input, output, session) {
  # structure
  output$structure <- renderPrint(
    
    my_data %>%
      str()
  )
  
  # summary
  output$summary <- renderPrint(
    
    my_data %>%
      summary()
  )
  
  # Datatable
  output$dataT <- renderDataTable(
    my_data
  )
}