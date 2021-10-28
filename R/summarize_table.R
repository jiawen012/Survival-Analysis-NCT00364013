#' @title summarize our data
#' @description This function takes a cleaned dataframe containing important parameters, and return the summary table
#' @param data_cleaned a cleaned data with important variables (usually you can directly use the "dl" data from this package)
#' @return a summary table
#' @export
#' @examples summarize_table(data_cleaned)
#'
summarize_table <- function(data_cleaned) {
  df <- as.data.frame(data_cleaned)
  df <- as.data.frame(lapply(df, as.factor))
  df <- transform(df, age = as.numeric(age), dthdy = as.numeric(dthdy), pfsdycr = as.numeric(pfsdycr))
  return(summary(df))
}
