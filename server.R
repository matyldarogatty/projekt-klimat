server = function(input, output) {
  output[["production_plot"]] = renderPlot({
    item_year_plot(production, 'yearP', "productP")
  })
  
  output[["consumption_plot"]] = renderPlot({
    item_year_plot(consumption, 'yearC', "productC")
  })
  
  output[["import_plot"]] = renderPlot({
    item_year_plot(import, 'yearI', "productI")
  })
  
  output[["export_plot"]] = renderPlot({
    item_year_plot(export, 'yearE', "productE")
  })
}
