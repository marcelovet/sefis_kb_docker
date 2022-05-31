if(!file.exists("/home/rstudio/rel_teste.pdf")){
  rmarkdown::render("/home/rstudio/texconfig.rmd", output_file="/home/rstudio/rel_teste.pdf")
}