library(data.table)
library(lubridate)
library(rbenchmark)
list.files()

file_paths = list.files("data_meat", pattern = "csv", full.names=TRUE)
food_files = vector("list", length(file_paths))

for (i in seq_along(file_paths)){
  food_files[[i]]=fread(file_paths[i])
}

head(food_files[[1]])

food_list = lapply(file_paths, fread)
food_list[[1]]
fad= food_files[[1]] #food_all_data
food_flags = food_files[[2]]
food_balance_sheets = food_files[[3]]

class(fad)
nrow(fad)
ncol(fad)
head(fad)
summary(fad)
str(fad)
dplyr::glimpse(fad)
fad[4]
colnames(fad)


fad = fad[, colnames(fad) %in% c("Area", "Item", "Element", "Y2010","Y2011","Y2012","Y2013",
                                 "Y2014","Y2015","Y2016","Y2017","Y2018","Y2019", "Unit"), with =FALSE]
fad = fad[!is.na(Y2010) & !is.na(Y2011) & !is.na(Y2012) & !is.na(Y2013) & !is.na(Y2014) & !is.na(Y2015) &
            !is.na(Y2016) & !is.na(Y2017) & !is.na(Y2018) & !is.na(Y2019)]

import_export = fad[Element =="Import Quantity" | Element == "Export Quantity"]
import =  fad[Element =="Import Quantity"]
export =  fad[Element =="Export Quantity"]

### FUNKCJE
choose_year = function(data_table, year_str){
  return (data_table[, colnames(data_table) %in% c("Area", "Item", "Element", year_str, "Unit"), 
                     with =FALSE])
}
imp_2018 = choose_year(import, "Y2018")

choose_product = function(dt, str_product){
  return(dt[Item == str_product])
}
veg_exp = choose_product(export, "Vegetables")

choose_row = function(col_name, str_value) fad_not_na[col_name == str_value]

barplot(veg_exp[[5]], names=veg_exp[[1]])
