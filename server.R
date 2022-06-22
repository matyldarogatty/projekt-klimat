server = function(input, output) {
  
  # produkcja
  output[["production_plot1"]] = renderPlot({
    item_year_plot(production, toString(input$yearP1), input$productP1)
  })
  
  output[["production_plot2"]] = renderPlot({
    area_year_plot(production, toString(input$yearP2), input$areaP2)
  })
  
  output[["production_plot3"]] = renderPlot({
    area_line(production, input$areaP3)
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
  
  # konsumpcja
  output[["consumption_plot1"]] = renderPlot({
    item_year_plot(consumption, toString(input$yearC1), input$productC1)
  })
  
  output[["consumption_plot2"]] = renderPlot({
    area_year_plot(consumption, toString(input$yearC2), input$areaC2)
  })
  
  output[["consumption_plot3"]] = renderPlot({
    area_line(consumption, input$areaC3)
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
  
  # import
  output[["import_plot1"]] = renderPlot({
    item_year_plot(production, toString(input$yearI1), input$productI1)
  })
  
  output[["import_plot2"]] = renderPlot({
    area_year_plot(production, toString(input$yearI2), input$areaI2)
  })
  
  output[["import_plot3"]] = renderPlot({
    area_line(production, input$areaI3)
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
  
  # export
  output[["export_plot1"]] = renderPlot({
    item_year_plot(production, toString(input$yearE1), input$productE1)
  })
  
  output[["export_plot2"]] = renderPlot({
    area_year_plot(production, toString(input$yearE2), input$areaE2)
  })
  
  output[["export_plot3"]] = renderPlot({
    area_line(production, input$areaE3)
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
