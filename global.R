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


food = food[, list(Area, Item, Element, `2010` = Y2010,
                   `2011` = Y2011, `2012` = Y2012,`2013` = Y2013,
                   `2014` = Y2014, `2015` = Y2015, `2016` = Y2016,
                   `2017` = Y2017, `2018` = Y2018, `2019` = Y2019)]

food = food[Element %in% c("Production", "Import Quantity", "Export Quantity",
                            "Food", "Tourist consumption")]
# unit - all 1000 tonnes

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
                       c("Area", "Item", "Element", year_str), 
                     with =FALSE])
}
imp_2018 = choose_year(import, "2018")

choose_product = function(dt, str_product){
  return(dt[Item == str_product])
}
veg_exp = choose_product(export, "Vegetables")

### WYKRESY
item_year_plot = function(dt, year, item){
  g = ggplot(dt[Item == item], aes(x = Area, y = get(year), fill = Area)) + 
  geom_bar(stat = 'identity') +
  labs(title = 'Amount of ___ in countries', 
       y = "Amount of product (1000 tonnes)", x = "Country") +
  theme_minimal() +
  coord_flip() +
  theme(legend.position = "None") 
  return(g)
}
item_year_plot(import, '2018', 'Pulses')

area_year_plot = function(dt, year, area){
  g = ggplot(dt[Area == area], aes(x = Item, y = get(year), fill = Item)) + 
    geom_bar(stat = 'identity') +
    labs(title = 'Amount of products in ___', 
         y = "Amount of product (1000 tonnes)", x = "Product") +
    theme_minimal() +
    theme(legend.position = "None") +
    coord_flip()
  return(g)
}
area_year_plot(import, '2018', 'Albania')

area_item_plot = function(dt, year, area){
  g = ggplot(dt[Area == area], aes(x = Item, y = get(year), fill = Item)) + 
    geom_bar(stat = 'identity') +
    theme(legend.position = "None") +
    coord_flip()
  return(g)
}
area_year_plot(import, '2018', 'Albania')




