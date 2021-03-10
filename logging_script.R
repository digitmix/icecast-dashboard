library("rjson")
library("RMariaDB")

radioname <- "Nowe Radio"
#for tests
#json_url <- "C:/Users/user/Documents/workspace/R/test_status-json.xsl.json"
json_url <- "https://stream.profeto.pl/status-json.xsl"

interval0 <- 15

rmariadb.settingsfile<-"C:\\Users\\user\\Documents\\workspace\\R\\dbdata.cnf"

rmariadb.db<-"db_f160"
storiesDb<-dbConnect(RMariaDB::MariaDB(),default.file=rmariadb.settingsfile,group=rmariadb.db)


#show tables in database, confirm db connection
dbListTables(storiesDb)

while(TRUE){

flag <- FALSE    
result <- fromJSON(file = json_url)
  
for (n in result$icestats$source) {
  if(n$server_name != "Nowe Radio"){
    next
  }
  listeners <- n$listeners
  flag <- TRUE

  query<-paste("INSERT INTO rdaszbord2 (listeners) VALUES('",as.character(listeners),"');")

  rsInsert <- dbSendQuery(storiesDb, query)
  dbClearResult(rsInsert)
    
  break
  }

if (flag==FALSE){
  paste("Server", radioname, " not found")
} else {
  #paste("Server", radioname, " found")
}

Sys.sleep(10)

}

dbDisconnect(storiesDb)
