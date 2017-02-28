# edukacja badanych w latach 2000-2015

library(dplyr)
library(haven)

load("osoby.RData")

edu_dat <- do.call(rbind, lapply(0L:7, function(i) {
  single_year_dat <- osoby[, c(6, 111+i, 66+i, 29+i)] %>% 
    filter(!is.na(.[[2]]), !is.na(.[[1]])) %>%
    mutate_each(funs(as_factor), -4) %>% 
    filter(.[[3]] %in% c("25-34 lata", "35-44 lata", "45-59 lat", 
                         "60-64 lata", "65+ lat")) 
  
  year <- strsplit(colnames(single_year_dat)[[2]], "_")[[1]][2]
  colnames(single_year_dat) <- c("plec",
                                 "edukacja",
                                 "wiek",
                                 "waga")
  
  group_by(single_year_dat, plec, edukacja, wiek) %>% 
    summarise(waga = sum(waga, na.rm = TRUE), rok = year) %>% 
    data.frame
}))

write.csv(edu_dat, file = "education_data.csv")
