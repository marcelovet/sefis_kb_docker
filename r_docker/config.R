if(!file.exists("/home/rstudio/credenciais.txt")){
  rmarkdown::render("/home/rstudio/texconfig.rmd", output_file="/home/rstudio/rel_teste.pdf")
}