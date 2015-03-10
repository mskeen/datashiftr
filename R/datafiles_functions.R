#' datafiles_list
#'
#' Retrieves a list of your datafiles from datashift.ca.
#' @param api_key Your Datashift api_key
#' @keywords datashift datafile list
#' @export
#' @examples
#' datafiles_list(api_key="123abc")

datafiles_list <- function(api_key) {
  files_json <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles.json?api_key=", api_key))
  df_list <- RJSONIO::fromJSON(files_json)
  df_list <- do.call("rbind", df_list)
  df_list <- data.frame(content)
  return(df_list)
}

#' datafiles_content
#'
#' Retrieves the content of a datafile from datashift.ca
#' @param api_key Your Datashift api_key
#' @param datafile_id The id of the file to be retrieved.
#' @keywords datashift datafile content
#' @export
#' @examples
#' datafiles_content(api_key="123abc", datafile_id="12345")
datafile_content <- function(api_key, datafile_id) {
  content_csv <- RCurl::getURL(paste0("https://datashift.ca/api/v1/datafiles/", datafile_id, ".csv?api_key=", api_key))
  content <- read.csv(text=content_csv)
  return(content)
}
