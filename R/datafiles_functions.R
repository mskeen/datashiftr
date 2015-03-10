datafiles_list <- function(api_key) {
  files_json <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles.json?api_key=", api_key))
  df_list <- RJSONIO::fromJSON(files_json)
  df_list <- do.call("rbind", df_list)
  df_list <- data.frame(content)
  return(df_list)
}

datafile_content <- function(api_key, datafile_id) {
  content_csv <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles/", datafile_id, ".csv?api_key=", api_key))
  content <- read.csv(text=content_csv)
  return(content)
}
