library(DBI)
library(tidyverse)

con <- dbConnect(RPostgres::Postgres(), dbname = 'teste',
                 host = 'kb-sefis-postgres',
                 port = 5432,
                 user = 'teste',
                 password = 'teste123')

dbListTables(con)
dbListFields(con, "clientes")
dbReadTable(con, "clientes")

dbReadTable(con, "clientes") %>% dplyr::filter(estado=="TT")
cliente <- str_c('teste', seq(11, 20))
estado <- 'FF'
sexo <- 'M'
status <- 'Boçãl'
for (i in 1:10) {
  query <- str_c("INSERT INTO clientes(cliente, estado, sexo, status) VALUES(",
                 "'", cliente[i], "', ",
                 "'", estado, "', ",
                 "'", sexo, "', ",
                 "'", status, "'",
                 ")")
  sendquery <- dbSendQuery(con, query)
  dbClearResult(sendquery)
}

dbReadTable(con, "clientes") %>% dplyr::filter(estado=="FF")
dbDisconnect(con)