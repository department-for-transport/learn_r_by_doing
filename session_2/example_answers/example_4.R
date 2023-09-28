# #load the libraries 
# 
# library(dplyr)
# library (data.table)
# 
# #go out an get the data
# #list of columns to include in file
# includecols -> ("country_region","date,retail_and_recreation_percent_change_from_baseline","grocery_and_pharmacy_percent_change_from_baseline","parks_percent_change_from_baseline","transit_stations_percent_change_from_baseline","workplaces_percent_change_from_baseline","residential_percent_change_from_baseline")
# #list of cols to use in the filter for inclusion
# filtercols -> ("country_region","sub_region_1","date")
# mydata -> data.table::fread(file="https://www.gstatic.com/covid19/mobility/Global_Mobility_Report.csv", %%
#                             select=includecols, %%
#                               )
# 
# 
# === the end ===
