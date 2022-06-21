#biblioteki
library(ggplot2)
library(data.table)
library(shiny)
library(shinythemes)
library(plyr)
library(shinyWidgets)

#czyszczenie danych

#list.files("data",pattern = "csv",full.names = TRUE)

#file_paths =list.files("data",pattern = "csv",full.names = TRUE)

food = fread('FoodData.csv')
#food = fread(file_paths)
food = food[Y2012> 0 & !is.na(Y2012) & !is.na(Y2010) & Y2010> 0 & !is.na(Y2011) 
           & Y2011> 0 & !is.na(Y2013) & Y2013> 0 & !is.na(Y2014) & Y2014> 0 
           & !is.na(Y2015) & Y2015> 0 & !is.na(Y2016) & Y2016> 0 
           & !is.na(Y2017) & Y2017> 0 & !is.na(Y2018) & Y2018> 0 
           & !is.na(Y2019) & Y2019> 0] 


food = food[, list(Area, Item, Element, Unit,
                    `2010` = Y2010,
                   `2011` = Y2011, `2012` = Y2012,`2013` = Y2013,
                   `2014` = Y2014, `2015` = Y2015, `2016` = Y2016,
                   `2017` = Y2017, `2018` = Y2018, `2019` = Y2019)]

food = food[Element %in% c("Production", "Import Quantity", "Export Quantity",
                            "Food", "Tourist consumption")]
# all 1000 tonnes
food[, Unit := NULL]

# wybrane produkty
products = c("Cereals - Excluding Beer", "Sugar & Sweeteners", "Pulses", 
             "Nuts and products", "Vegetables", "Fruits - Excluding Wine", 
             "Wine", "Beer", 'Spices', 'Meat', "Bovine Meat", 
             'Mutton & Goat Meat', "Poultry Meat", "Milk - Excluding Butter", 
             'Eggs', "Fish, Seafood")
food = food[Item %in% products]

country = unique(food[["Area"]])[1:178]
food = food[Area %in% country]

import =  food[Element =="Import Quantity"]
import[, Element := NULL]

export =  food[Element =="Export Quantity"]
export[, Element := NULL]

production = food[Element =="Production"]
production[, Element := NULL]

consumption = food[Element == 'Food' | Element == 'Tourist consumption']
consumption[, Element := NULL]

### FUNKCJE
choose_year = function(data_table, year_str){
  return (data_table[, colnames(data_table) %in% 
                       c("Area", "Item", "Element", year_str, "Unit"), 
                     with =FALSE])
}
imp_2018 = choose_year(import, "Y2018")

choose_product = function(dt, str_product){
  return(dt[Item == str_product])
}
veg_exp = choose_product(export, "Vegetables")

