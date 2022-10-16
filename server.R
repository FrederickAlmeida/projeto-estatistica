library(DT)
library(ggcorrplot)
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
  
  output$scatter <- renderPlotly({
    p = my_data %>% 
      ggplot(aes(x=get(input$var3), y=get(input$var4))) +
      geom_point() +
      geom_smooth(method="lm") +
      labs(title = paste("Relation between", input$var3 , "and" , input$var4),
           x = input$var3,
           y = input$var4) +
      theme(  plot.title = element_textbox_simple(size=10,
                                                  halign=0.5))
    
    ggplotly(p)
  })
  
  
  output$bar <- renderPlotly({
    my_data %>%
      plot_ly() %>%
      add_bars(x=~Country..Other, y=~get(input$var2)) %>%
      layout(title = paste(input$var2, "x Country"),
             xaxis = list(title="Country"),
             yaxis = list(title=paste(input$var2)))
  })
  
}