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
  
  output[["summary2"]] = renderDT({
    
    if (input$region2 == "-" & input$product2=="-"){
      food[Element=="Food"]}
    else if(input$product2 == "-"){
      food[Element=="Food"& Area==input$region2]
    }
    else if(input$region2 == "-"){
      food[Element=="Food" & Item==input$product2]
    }
    else{
      food[Element=="Food" & Area==input$region2 & Item==input$product2]
    }
  })
  
  
  output[["import_plot"]] = renderPlot({
    item_year_plot(import, toString(input$yearI), input$productI)
  })
  
  output[["summary3"]] = renderDT({
    
    if (input$region3 == "-" & input$product3=="-"){
      food[Element == "Import Quantity"]}
    else if(input$product3 == "-"){
      food[Element == "Import Quantity" & Area==input$region3]
    }
    else if(input$region3 == "-"){
      food[Element == "Import Quantity" & Item==input$product3]
    }
    else{
      food[Element=="Import Quantity" & Area==input$region3 & Item==input$product3]
    }
  })
  
  
  output[["export_plot"]] = renderPlot({
    item_year_plot(export, toString(input$yearE), input$productE)
  })
  
  output[["summary4"]] = renderDT({
    
    if (input$region4 == "-" & input$product4=="-"){
      food[Element == "Export Quantity"]}
    else if(input$product4 == "-"){
      food[Element == "Export Quantity" & Area==input$region4]
    }
    else if(input$region4 == "-"){
      food[Element == "Export Quantity" & Item==input$product4]
    }
    else{
      food[Element=="Export Quantity" & Area==input$region4 & Item==input$product4]
    }
  })
}
