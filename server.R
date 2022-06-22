server = function(input, output) {
  output[["production_plot"]] = renderPlot({
    item_year_plot(production, toString(input$yearP), input$productP)
  })
  
  output[["summary"]] = renderDT({
    
    if (input$region=="-"){
    food[Element=="Production"]}
    else{
      food[Element=="Production" & Area==input$region ]
    }
  })
  
  output[["consumption_plot"]] = renderPlot({
    item_year_plot(consumption, toString(input$yearC), input$productC)
  })
  output[["import_plot"]] = renderPlot({
    item_year_plot(import, toString(input$yearI), input$productI)
  })
  
  output[["export_plot"]] = renderPlot({
    item_year_plot(export, toString(input$yearE), input$productE)
  })
}
