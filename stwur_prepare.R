install.packages("devtools", repos = "https://cloud.r-project.org/")
devtools::install_github("rstudio/tutor")
download.file(url = "https://raw.githubusercontent.com/STWUR/STWUR-2017-03-01/master/tutorial_wizualizacje.Rmd", 
              destfile = "tutorial_wizualizacje.Rmd")
#rmarkdown::run("tutorial_wizualizacje.Rmd")
