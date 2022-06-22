server = function(input, output) {
  output[["production_plot"]] = renderPlot({
    item_year_plot(production, input$regionP, input$productP)
  })
  
  output[["summary"]] = renderDT({
    food[Element=="Production" & Area==input$region & Item==input$product]
  })
  
  output[["consumption_plot"]] = renderPlot({
    item_year_plot(consumption, input$regionC, input$productC)
  })
  output[["import_plot"]] = renderPlot({
    item_year_plot(import, input$regionI, input$productI)
  })
  
  output[["export_plot"]] = renderPlot({
    item_year_plot(export, input$regionE, input$productE)
  })
}
