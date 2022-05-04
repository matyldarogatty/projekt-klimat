library(data.table)
library(plyr)
library(ggplot2)

# ograniczkik zeby nie bylo malych panstw

setwd('~/Desktop/5_SEM/PiADwR/meat_project')

data = fread('FoodBalanceSheets_E_All_Data_NOFLAG.csv')

# dla wszystkich unit == 1000 tonnes
data_dt = data[, list(Area, Item, Element, Y2010, Y2011, Y2012,
                      Y2013, Y2014, Y2015, Y2016, Y2017, Y2018, Y2019)]

# ograniczenie do konsumpcji
feeding = data_dt[Element == 'Food' | Element == 'Tourist consumption']

# usunięcie wierszy z wszystkimi NaNami lub zerami
feeding[, nans := (is.na(Y2010) | Y2010 == 0) & (is.na(Y2011) | Y2011 == 0)
        & (is.na(Y2012) | Y2012== 0) & (is.na(Y2013) | Y2013 == 0) &
          (is.na(Y2014) | Y2014 == 0) & (is.na(Y2015) | Y2015 == 0) &
          (is.na(Y2016) | Y2016 == 0) & (is.na(Y2017) | Y2017 == 0) &
          (is.na(Y2018) | Y2018 == 0) & (is.na(Y2019) | Y2019 == 0)]

feeding = feeding[nans == FALSE]
feeding[, nans := NULL]

# dodanie do siebie wartości z Food & Tourist
feeding = as.data.table(ddply(feeding, c("Area", 'Item'), numcolwise(sum)))

cereals = feeding[Item == "Cereals - Excluding Beer"]
cereals[, Item := NULL]

starchs_vec = c("Starchy Roots", "Cassava and products", 
                "Potatoes and products", "Sweet potatoes", 
                "Yams", "Roots, Other")

starch = feeding[Item %in% starchs_vec]
starch[, Item := NULL]

sugar = feeding[Item == "Sugar & Sweeteners"]
sugar[, Item := NULL]

pulses = feeding[Item == 'Pulses']
pulses[, Item := NULL]

nuts_vec = c("Treenuts", "Nuts and products", "Groundnuts")

nuts = feeding[Item %in% nuts_vec]
nuts[, Item := NULL]

fats_vec = c("Oilcrops", "Vegetable Oils", "Animal fats", "Butter, Ghee")

fats = feeding[Item %in% fats_vec]
fats[, Item := NULL]

seeds_vec <- c("Sunflower seed", "Rape and Mustardseed", "Cottonseed", 
               "Coconuts - Incl Copra", "Sesame seed", "Palm kernels")

seeds = feeding[Item %in% seeds_vec]
seeds[, Item := NULL]

vegetables = feeding[Item == 'Vegetables']
vegetables[, Item := NULL]

fruits = feeding[Item == "Fruits - Excluding Wine"]
fruits[, Item := NULL]

tea = feeding[Item == "Tea (including mate)"]
tea[, Item := NULL]

caff = feeding[Item == "Cocoa Beans and products"]
caff[, Item := NULL]

stimulants_vec <- c("Stimulants", "Alcoholic Beverages")

stimulants = feeding[Item %in% stimulants_vec]
stimulants[, Item := NULL]

continents = c('Africa', 'Asia', 'Australia', 'Europe', 'Northern America',
               'South America')

meat_continents = feeding[Item == 'Meat' & Area %in% continents]
meat_continents = meat_continents[, list(Area, Y2010)]

ggplot(meat_continents[Y2010 > 0 & !is.na(Y2010)], aes(x=Area, y=Y2010, 
                                                       fill = Area)) + 
  geom_bar(stat = 'identity') + 
  coord_flip() + 
  theme_bw() + 
  labs(title = 'Meat production on continents in 2010', 
       y = 'Meat production (1000 tonnes)', x = 'Continent') +
  theme(plot.title = element_text(hjust = 0.5))
