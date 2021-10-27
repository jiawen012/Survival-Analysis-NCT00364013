#' @title Plot variables
#'
#' @description In hw1, this function is used to explore relationships between pfsdycr and dthdy
#'
#' @param plot_data a cleaned data with important variables
#' @param v1 a variable on x axis
#' @param v2 a variable on y axis
#'
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal
#'
#' @export
#'
#' @examples tmp<-data(tmp);plot_trt(tmp,pfsdycr,dthdy)
plot_trt = function(plot_data, v1, v2)
{
  ggplot(plot_data, aes(v1, v2, color = trt))+geom_point()
}

#' @title Plot panels for tmp data
#'
#' @description In hw1, this function is used to plot the correlations among all variables in tmp data
#'
#' @param plot_data a cleaned data with important variables
#'
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal
#' @importFrom psych pairs.panels
#' @export
#'
#' @examples tmp<-data(tmp);plot_panels(tmp)
plot_panels = function(plot_data){
  pairs.panels(plot_data[,-2],pch = 21,bg=c("red","purple")[unclass(plot_data$trt)],main='Distribution/correlation in multible variables in two groups')+geom_point()
}

#' @title Plot a histogram of variables
#'
#' @description TODO: add this later
#' @param tmp a dataframe with target variables
#' @param var the target variable
#' @export
#' @importFrom ggplot2 ggplot aes geom_line geom_point
#' theme_minimal geom_histogram
#' @importFrom psych pairs.panels
#' @export

plot_hist = function(tmp, pfsdycr){
  ggplot(data = tmp, aes(x = pfsdycr, fill = atrt)) +
    geom_histogram(bins = 30) +
    labs(fill=c('treatment group'))+ facet_grid(atrt ~.)
}


