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
             "Nuts and products", "Potatoes and products", "Onions", 
             "Oranges, Mandarines", "Bananas", "Apples and products", 
             "Grapes and products (excl wine)","Wine", "Beer", 'Spices', 
             "Bovine Meat", "Tomatoes and products", "Lemons, Limes and products",
             'Mutton & Goat Meat', "Poultry Meat", "Milk - Excluding Butter", 
             'Eggs', "Fish, Seafood", "Pigmeat", "Pineapples and products")
food = food[Item %in% products]

# ograniczenie krajów z małymi wartościami
food = food[Area %in% unique(food[["Area"]])[1:178]]

food[, s := `2010` + `2011` + `2012` + `2013` + `2014` + `2015` + 
       `2016` + `2017` + `2018` + `2019`]
long = melt(food, id.vars = 'Area', measure.vars = 's')
small = unique(long[, su := sum(value), 
                    by = c('Area')][, list(Area, su)])[order(su)][, Area][1:60]
food = food[!(Area %in% small)]
food = food[!(Area %in% c('China, Hong Kong SAR', 'China, mainland', 
                          'China, Taiwan Province of', "C\xf4te d'Ivoire"))]

country = unique(food[, Area])
# wywalać chiny inne niż chiny

# podział na Elementy

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
item_year_plot = function(DT, year, item){
  dt = choose_year(DT, year)
  g = ggplot(dt[Item == item], aes(x = Area, y = get(year), fill = Area)) + 
    geom_bar(stat = 'identity') +
    labs(title = 'Amount of ___ in countries', 
         y = "Amount (1000 tonnes)", x = "Country") +
    theme_minimal() +
    coord_flip() +
    theme(legend.position = "None") 
  return(g)
}
item_year_plot(import, '2018', 'Pulses')

area_year_plot = function(dt, year, area){
  g = ggplot(dt[Area == area], aes(x = Item, y = get(year), fill = Item)) + 
    geom_bar(stat = 'identity') +
    labs(title = 'Amount of products in ___ in ____', 
         y = "Amount (1000 tonnes)", x = "Product") +
    theme_minimal() +
    theme(legend.position = "None") +
    coord_flip()
  return(g)
}
area_year_plot(import, '2018', 'China')





