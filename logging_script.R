library("rjson")
json_url <- "https://stream.profeto.pl/status-json.xsl"
result <- fromJSON(file = json_url)
