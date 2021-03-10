library("RMariaDB")
library("ggplot2")

listenersplot <- function(input) {

rmariadb.settingsfile<-"C:\\Users\\user\\Documents\\workspace\\R\\dbdata.cnf"

rmariadb.db<-"db_f160"
storiesDb<-dbConnect(RMariaDB::MariaDB(),default.file=rmariadb.settingsfile,group=rmariadb.db)


dbListTables(storiesDb)

audtion <- dbGetQuery(storiesDb, 'SELECT * FROM rdaszbord2')

#dbClearResult(rsInsert)
dbDisconnect(storiesDb)

#datarangeset <- TRUE
paste("Server", radioname, " not found")
start <- paste(input$date1, " 00:00:00")
end <- paste(input$date2, " 23:59:59")
#end <- '2021-03-09 18:00:00'

p <- ggplot(audtion, aes(x=time, y=listeners)) +
  geom_line() + 
  geom_point() #+
  #labs(x = paste(input$date1, "-", input$date2))

if(input$checkbox){
  
  p+ xlim(c(as.POSIXct(start, format = "%Y-%m-%d %H:%M:%S"),
         as.POSIXct(end, format = "%Y-%m-%d %H:%M:%S")))
} else {
  p  
}
}