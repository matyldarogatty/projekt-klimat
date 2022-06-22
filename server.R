server = function(input, output) {
  output[["production_plot"]] = renderPlot({
    item_year_plot(production, toString(input$yearP), input$productP)
  })
  
  output[["summary"]] = renderDT({
    
    if (input$region == "-" & input$product=="-"){
    food[Element == "Production"]}
    else if(input$product == "-"){
      food[Element == "Production" & Area==input$region]
    }
    else if(input$region == "-"){
      food[Element == "Production" & Item==input$product]
    }
    else{
      food[Element=="Production" & Area==input$region & Item==input$product]
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
