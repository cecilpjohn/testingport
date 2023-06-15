library(tidyverse)
setwd("D:/connect4c-Downloads/GU/Job/Global Health/Raw Data")
file <- read_excel("names.xlsx")


countryname <- file$country

reports <- tibble(
  output_file = stringr::str_c("run3/allhigh/", countryname, "-Background.html"),
  params = map(countryname, ~list(countryname = .))
)


reports %>%
  pwalk(rmarkdown::render, input = "draftv1.Rmd")
