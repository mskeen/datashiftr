datafiles_list <- function(api_key) {
  files_json <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles.json?api_key=", api_key))
  df_list <- RJSONIO::fromJSON(files_json)
  df_list <- do.call("rbind", df_list)
  return(df_list)
}

datafile_content <- function(api_key, datafile_id) {
  content_json <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles/", datafile_id, ".json?api_key=", api_key))
  content <- RJSONIO::fromJSON(content_json)
  content <- do.call("rbind", content)
  return(content)
}
