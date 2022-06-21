ui = fluidPage(
  setBackgroundColor(
    color = c("#58d68d")
  ),
  
  titlePanel("World food analysis"),
  sidebarLayout(
    sidebarPanel(
      
      selectInput(inputId = "produkt", 
                  label = "Choose product",
                  choices = products,
                  selected = 1),
      
      selectInput(inputId = "region", 
                  label = "Choose region",
                  choices = country,
                  selected = 1),
      
      sliderInput(inputId = 'year',
                  label = 'Choose year',
                  min = 2010,
                  max = 2019,
                  value = c(2010),
                  sep = '')
      
    ),
    mainPanel(
      tabsetPanel(
        
        tabPanel("Production",
                 p("Wykresy dot. produkcji - najlepiej barploty,")),
        
        tabPanel("Consumption",
                 p("Wykresy dot konsumpcji")),
        
        tabPanel("Import",
                 p("Wykresy dot importuu")),
        tabPanel('Export',
                 p("Wykresy dot expotu"))
        
      ))
  ))

