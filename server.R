server = function(input, output) {
  output[["production_plot"]] = renderPlot({
    item_year_plot(production, input[['yearP']], input[["productP"]])
  })
  
  output[["consumption_plot"]] = renderPlot({
    item_year_plot(consumption, input[['yearC']], input[["productC"]])
  })
  
  output[["import_plot"]] = renderPlot({
    item_year_plot(import, input[['yearI']], input[["productI"]])
  })
  
  output[["export_plot"]] = renderPlot({
    item_year_plot(export, input[['yearE']], input[["productE"]])
  })
}
