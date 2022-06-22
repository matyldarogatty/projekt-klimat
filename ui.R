ui = fluidPage(theme = shinytheme("united"),
  
  titlePanel("World food analysis"),
    mainPanel(
      tabsetPanel(
        tabPanel("Production",
                 tabsetPanel(
                   tabPanel("Plot",

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
                               sep = '')),
                 mainPanel(
                   plotOutput(outputId = "production_plot", 
                              width = 1100, height = 900))),
                 
                 tabPanel("Data",
                          fluidRow(
                            column(width = 6,
                                 selectInput(inputId = "region", 
                                      label = "Choose region",
                                      choices = c("-",country),
                                      selected = 1),
                          
                          selectInput(inputId = "product", 
                                      label = "Choose product",
                                      choices = c("-",products),
                                      selected = 1),
                          
                          submitButton("Update View")),
                          
                          dataTableOutput("summary")
                          
                 )))),

        
        tabPanel("Consumption",
               tabsetPanel(
                tabPanel("Plot",
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
                               sep = '')),
                   mainPanel(
                     plotOutput(outputId = "consumption_plot"))),
                 
                 tabPanel("Data",
                          fluidRow(
                            column(width = 6,
                                   selectInput(inputId = "region2", 
                                               label = "Choose region",
                                               choices = c("-",country),
                                               selected = 1),
                                   
                                   selectInput(inputId = "product2", 
                                               label = "Choose product",
                                               choices = c("-",products),
                                               selected = 1),
                                   
                                   submitButton("Update View")),
                            
                            dataTableOutput("summary2")
                 )))),
        
        tabPanel("Import",
                tabsetPanel(
                  tabPanel("Plot",
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
                               sep = '')),
                   mainPanel(
                     plotOutput(outputId = "import_plot"))),
                 tabPanel("Data",
                          fluidRow(
                            column(width = 6,
                                   selectInput(inputId = "region3", 
                                               label = "Choose region",
                                               choices = c("-",country),
                                               selected = 1),
                                   
                                   selectInput(inputId = "product3", 
                                               label = "Choose product",
                                               choices = c("-",products),
                                               selected = 1),
                                   
                                   submitButton("Update View")),
                            
                            dataTableOutput("summary3")
                          ))
                 )),
        
        tabPanel("Export",
                 tabsetPanel(
                   tabPanel("Plot",
                 sidebarPanel(
                   selectInput(inputId = "productE", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   selectInput(inputId = "regionE", 
                               label = "Choose region",
                               choices = c(country),
                               selected = 1),
                   
                   sliderInput(inputId = 'yearE',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = '')),
                   mainPanel(
                     plotOutput(outputId = "export_plot"))),
                 tabPanel("Data", 
                          fluidRow(
                            column(width = 6,
                                   selectInput(inputId = "region4", 
                                               label = "Choose region",
                                               choices = c("-",country),
                                               selected = 1),
                                   
                                   selectInput(inputId = "product4", 
                                               label = "Choose product",
                                               choices = c("-",products),
                                               selected = 1),
                                   
                                   submitButton("Update View")),
                            
                            dataTableOutput("summary4")
                          )))
                 ),
        
        tabPanel("Information",
                 column(width = 6,
                        h3("Authors"),
                        p("Matylda Rogatty"),
                        p("Aleksandra Ziętek"),
                        p("Klaudia Tuńska")),
                 column(width = 6,
                        h3("Data"),

                        p("All of the data in the application comes 
                          from www.fao.org, a website of Food and Agriculture 
                          Organization of the United Nations."))))
))
        


