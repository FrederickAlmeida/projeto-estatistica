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

  
  # stacked histogram and boxplot
  output$histplot <- renderPlotly({
    
    p1 = my_data %>%
      plot_ly() %>%
      add_histogram(~get(input$var1)) %>%
      layout(xaxis = list(input$var1))
    
    p2 = my_data %>%
      plot_ly() %>%
      add_boxplot(~get(input$var1)) %>%
      layout(yaxis = list(showticklabels = F))
    
    subplot(p1, p2, nrows = 2)  %>%
      hide_legend() %>%
      layout(title = "Histogram and Boxplot",
             yaxis = list(title="Frequency"))
    
  })
  
}