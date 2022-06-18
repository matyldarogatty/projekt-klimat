#tu dodajemy wszystkie biblioteki, które używamy w kodzie plus tu będzie obrobiany plik z danymi
library(ggplot2)
library(data.table)
library(shiny)
library(shinythemes)
library(plyr)



#czyszczenie danych

list.files("data",pattern = "csv",full.names = TRUE)

file_paths =list.files("data",pattern = "csv",full.names = TRUE)

food<-fread(file_paths)
food<-food[Y2012> 0 & !is.na(Y2012) & !is.na(Y2010) & Y2010> 0 & !is.na(Y2011) 
           & Y2011> 0 & !is.na(Y2013) & Y2013> 0 & !is.na(Y2014) & Y2014> 0 
           & !is.na(Y2015) & Y2015> 0 & !is.na(Y2016) & Y2016> 0 
           & !is.na(Y2017) & Y2017> 0 & !is.na(Y2018) & Y2018> 0 
           & !is.na(Y2019) & Y2019> 0] 


food = food[, list(Area, Item, Element, Unit,  
                                `2010` = Y2010,
                   `2011` = Y2011, `2012` = Y2012,`2013` = Y2013,
                   `2014` = Y2014, `2015` = Y2015, `2016` = Y2016,
                   `2017` = Y2017, `2018` = Y2018, `2019` = Y2019)]
