ui = fluidPage(theme = shinytheme("united"),
  
  titlePanel("World food analysis"),
    mainPanel(
      tabsetPanel(
        tabPanel("Production",
                 tabsetPanel(
                   tabPanel("Plot",
                 p("Wykresy dot. produkcji - najlepiej barploty, mapka"),
                 sidebarPanel(
                   
                   selectInput(inputId = "productP", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   selectInput(inputId = "regionP", 
                               label = "Choose region",
                               choices = country,
                               selected = 1),
                   
                   sliderInput(inputId = 'yearP',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = ''),
                   plotOutput(outputId = "production_plot")
                   
                 )),
                 tabPanel("Dane",
                                   dataTableOutput("summary")))),
        
        tabPanel("Consumption",
                 p("Wykresy dot konsumpcji"),
                 sidebarPanel(
                   selectInput(inputId = "productC", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   selectInput(inputId = "regionC", 
                               label = "Choose region",
                               choices = country,
                               selected = 1),
                   
                   sliderInput(inputId = 'yearC',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = ''),
                   plotOutput(outputId = "consumption_plot")
                   )),
        
        tabPanel("Import",
                 p('Wykresy dot importu'),
                 sidebarPanel(
                   selectInput(inputId = "productI", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   selectInput(inputId = "regionI", 
                               label = "Choose region",
                               choices = country,
                               selected = 1),
                   
                   sliderInput(inputId = 'yearI',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = ''),
                   plotOutput(outputId = "import_plot")
                 )),
        
        tabPanel("Export",
                 p('Wykresy dot exportu'),
                 sidebarPanel(
                   selectInput(inputId = "productE", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   selectInput(inputId = "regionE", 
                               label = "Choose region",
                               choices = country,
                               selected = 1),
                   
                   sliderInput(inputId = 'yearE',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = ''),
                   plotOutput(outputId = "export_plot")
                 )),
        
        tabPanel("Information",
                 column(width = 6,
                        h3("Authors"),
                        p("Matylda Rogatty"),
                        p("Aleksandra Ziętek"),
                        p("Klaudia Tuńska")),
                 column(width = 6,
                        h3("Data"),
                        p("All of the data in the application comes from ."))))
))
        

