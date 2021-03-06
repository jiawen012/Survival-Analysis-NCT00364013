#' @title Plot variables
#'
#' @description In hw1, this function is used to explore relationships between pfsdycr and dthdy
#' @param plot_data a cleaned data with specific variables
#' @param trt default
#' @param dthdy default
#' @param pfsdycr default
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal
#' @export
#' @examples plot_trt(tmp)
#'
plot_trt <- function(plot_data, pfsdycr = "pfsdycr", dthdy = "dthdy", trt = "trt")
{
  ggplot(plot_data, aes(pfsdycr, dthdy, color = trt))+geom_point()
}

#' @title Plot panels for tmp data
#'
#' @description In hw1, this function is used to plot the correlations among all variables in tmp data
#' @param plot_data a cleaned data with specific variables
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal
#' @importFrom psych pairs.panels
#' @export
#' @examples plot_panels(tmp)
#'
plot_panels <- function(plot_data){
  pairs.panels(plot_data[,-2],pch = 21,bg=c("red","purple")[unclass(plot_data$trt)],main='Distribution/correlation in multible variables in two groups')+geom_point()
}

#' @title Plot a histogram
#'
#' @description Plot the histogram pf the variable named "pfsdycr", to find the correlation between treatment group and experiment group
#' @param dt a cleaned data with specific variables
#' @param pfsdycr default
#' @param atrt default
#' @export
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal geom_histogram labs facet_grid
#' @export
#' @examples plot_hist(tmp)
#'
plot_hist <- function(dt, pfsdycr = "pfsdycr", atrt = "atrt"){
  ggplot(data = dt, aes(x = pfsdycr, fill = atrt)) +
    geom_histogram(bins = 30) +
    labs(fill=c('treatment group')) +
    facet_grid(atrt ~.)
}


