ui = fluidPage(theme = shinytheme("united"),
  
  titlePanel("World food analysis"),
    mainPanel(
      tabsetPanel(
        tabPanel("Production",
                 tabsetPanel(
                   tabPanel("Product/Year Plot",

                 sidebarPanel(
                   selectInput(inputId = "productP1", 
                               label = "Choose product",
                               choices = products,
                               selected = 1),
                   
                   sliderInput(inputId = 'yearP1',
                               label = 'Choose year',
                               min = 2010,
                               max = 2019,
                               value = c(2010),
                               sep = ''),
                   
                   submitButton("Update View")),
                 
                 
                 mainPanel(
                   plotOutput(outputId = "production_plot1", 
                              width = 1100, height = 900))),
                 
                 tabPanel("Area/Year Plot",
                          
                          sidebarPanel(
                            selectInput(inputId = "areaP2", 
                                        label = "Choose country",
                                        choices = country,
                                        selected = 1),
                            
                            sliderInput(inputId = 'yearP2',
                                        label = 'Choose year',
                                        min = 2010,
                                        max = 2019,
                                        value = c(2010),
                                        sep = ''),
                            
                            submitButton("Update View")),
                          
                          
                          mainPanel(
                            plotOutput(outputId = "production_plot2", 
                                       width = 1100, height = 600))),
                 
                 tabPanel("Area Plot",
                         
                         sidebarPanel(
                           selectInput(inputId = "areaP3", 
                                       label = "Choose country",
                                       choices = country,
                                       selected = 1),
                
                           submitButton("Update View")),
                         
                         
                         mainPanel(
                           plotOutput(outputId = "production_plot3", 
                                      width = 1100, height = 600))),
                 
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
                   tabPanel("Product/Year Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "productC1", 
                                          label = "Choose product",
                                          choices = products,
                                          selected = 1),
                              
                              sliderInput(inputId = 'yearC1',
                                          label = 'Choose year',
                                          min = 2010,
                                          max = 2019,
                                          value = c(2010),
                                          sep = ''),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "consumption_plot1", 
                                         width = 1100, height = 900))),
                   
                   tabPanel("Area/Year Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "areaC2", 
                                          label = "Choose country",
                                          choices = country,
                                          selected = 1),
                              
                              sliderInput(inputId = 'yearC2',
                                          label = 'Choose year',
                                          min = 2010,
                                          max = 2019,
                                          value = c(2010),
                                          sep = ''),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "consumption_plot2", 
                                         width = 1100, height = 600))),
                   
                   tabPanel("Area Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "areaC3", 
                                          label = "Choose country",
                                          choices = country,
                                          selected = 1),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "consumption_plot3", 
                                         width = 1100, height = 600))),
                   
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
                  tabPanel("Product/Year Plot",
                           
                           sidebarPanel(
                             selectInput(inputId = "productI1", 
                                         label = "Choose product",
                                         choices = products,
                                         selected = 1),
                             
                             sliderInput(inputId = 'yearI1',
                                         label = 'Choose year',
                                         min = 2010,
                                         max = 2019,
                                         value = c(2010),
                                         sep = ''),
                             
                             submitButton("Update View")),
                           
                           
                           mainPanel(
                             plotOutput(outputId = "import_plot1", 
                                        width = 1100, height = 900))),
                  
                  tabPanel("Area/Year Plot",
                           
                           sidebarPanel(
                             selectInput(inputId = "areaI2", 
                                         label = "Choose country",
                                         choices = country,
                                         selected = 1),
                             
                             sliderInput(inputId = 'yearI2',
                                         label = 'Choose year',
                                         min = 2010,
                                         max = 2019,
                                         value = c(2010),
                                         sep = ''),
                             
                             submitButton("Update View")),
                           
                           
                           mainPanel(
                             plotOutput(outputId = "import_plot2", 
                                        width = 1100, height = 600))),
                  
                  tabPanel("Area Plot",
                           
                           sidebarPanel(
                             selectInput(inputId = "areaI3", 
                                         label = "Choose country",
                                         choices = country,
                                         selected = 1),
                             
                             submitButton("Update View")),
                           
                           
                           mainPanel(
                             plotOutput(outputId = "import_plot3", 
                                        width = 1100, height = 600))),
                  
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
                   tabPanel("Product/Year Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "productE1", 
                                          label = "Choose product",
                                          choices = products,
                                          selected = 1),
                              
                              sliderInput(inputId = 'yearE1',
                                          label = 'Choose year',
                                          min = 2010,
                                          max = 2019,
                                          value = c(2010),
                                          sep = ''),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "export_plot1", 
                                         width = 1100, height = 900))),
                   
                   tabPanel("Area/Year Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "areaE2", 
                                          label = "Choose country",
                                          choices = country,
                                          selected = 1),
                              
                              sliderInput(inputId = 'yearE2',
                                          label = 'Choose year',
                                          min = 2010,
                                          max = 2019,
                                          value = c(2010),
                                          sep = ''),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "export_plot2", 
                                         width = 1100, height = 600))),
                   
                   tabPanel("Area Plot",
                            
                            sidebarPanel(
                              selectInput(inputId = "areaE3", 
                                          label = "Choose country",
                                          choices = country,
                                          selected = 1),
                              
                              submitButton("Update View")),
                            
                            
                            mainPanel(
                              plotOutput(outputId = "export_plot3", 
                                         width = 1100, height = 600))),
                   
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
        
        tabPanel("Informations",
                 column(width = 6,
                        h3("Authors"),
                        p("Matylda Rogatty"),
                        p("Aleksandra Ziętek"),
                        p("Klaudia Tuńska")),
                 column(width = 6,
                        h3("Data"),

                        p("All of the data in the application comes 
                          from www.fao.org, a website of Food and Agriculture 
                          Organization of the United Nations.
                          This data relates to the production, consumption, import and export of various food products. 
                          Data attributes include area, product type, and quantity. Raw data was disordered, attributes repeated. 
                          We decided to minimize attributes of Area to countries, deleting the lines for continents."))))
))
        


