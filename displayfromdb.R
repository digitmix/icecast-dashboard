library("RMariaDB")
library("ggplot2")

rmariadb.settingsfile<-"C:\\Users\\user\\Documents\\workspace\\R\\dbdata.cnf"

rmariadb.db<-"db_f160"
storiesDb<-dbConnect(RMariaDB::MariaDB(),default.file=rmariadb.settingsfile,group=rmariadb.db)


dbListTables(storiesDb)

#query<-paste("INSERT INTO rdaszbord2 (listeners) VALUES('",as.character(listeners),"');")

#rsInsert <- dbSendQuery(storiesDb, query)



#dbWriteTable(storiesDb, 'cars', mtcars)
#asdf <- dbGetQuery(storiesDb, 'SELECT * FROM cars LIMIT 4')

asdf2 <- dbGetQuery(storiesDb, 'SELECT * FROM rdaszbord2')

#dbClearResult(rsInsert)
dbDisconnect(storiesDb)

datarangeset <- FALSE
start <- '2021-03-08 18:00:00'
end <- '2021-03-09 18:00:00'

p <- ggplot(asdf2, aes(x=time, y=listeners)) +
  geom_line() + 
  geom_point()

if(datarangeset){
  
  p+ xlim(c(as.POSIXct(start, format = "%Y-%m-%d %H:%M:%S"),
         as.POSIXct(end, format = "%Y-%m-%d %H:%M:%S")))
} else {
  p  
}
