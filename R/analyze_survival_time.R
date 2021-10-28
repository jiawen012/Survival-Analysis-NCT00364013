#' @title Make a survival analysis model
#'
#' @description use "survfit" to train the model and summary the result table
#' @param tmp a dataframe with target variables
#' @export
#' @importFrom survival survfit Surv
#' @return A survival fit model
#' @export
#' @examples survival_fit(tmp)
#'
survival_fit <- function(tmp, pfsdycr = "pfsdycr", pfscr = "pfscr", atrt = "atrt"){
  fit <- survfit(Surv(pfsdycr, pfscr) ~ atrt, data=tmp)
  print(summary(fit)$table)
  return(fit)
}

#' @title Plot a survival result
#'
#' @description plot a survival result between different group, to find whether different drugs have any different effect on survival time
#' @param fit The survival analysis model
#' @export
#' @importFrom survival survfit Surv
#' @importFrom survminer ggsurvplot
#' @return p a survival plot
#' @export
#' @examples plot_survival(survival_fit(tmp))

plot_survival <- function(fit){
  p <- ggsurvplot(
    fit,                     #survival model we want to plot
    pval = TRUE,              #displays p-value of log-rank test, if p-value < 0.05, then the difference between the two curves are statistically significant
    conf.int = TRUE,          #plots a confidence interval for each curve
    xlab = "Time in days",
    break.time.by = 150,      # break X axis in time intervals by 100.
    #ggtheme = theme_light(),  # customize theme with a grid for better readability
    risk.table = "abs_pct",   # absolute number and percentage at risk
    risk.table.y.text.col = T,# colour risk table text annotations
    risk.table.y.text = FALSE,# show bars instead of names in text annotations
    # in legend of risk table.
    ncensor.plot = TRUE,      # plot the number of censored subjects at time t
    surv.median.line = "hv"   # add the median survival pointer
  )
  print(p$plot)
  return(p)
}

#' @title print a cox result
#'
#' @description print a cox result
#' @param tmp tmp data from this package
#' @export
#' @importFrom survminer ggsurvplot
#' @importFrom survival survfit Surv coxph
#'
#' @return univariate cox fit model
#' @export
#' @examples summarize_cox(tmp)

summarize_cox <- function(tmp, pfsdycr = "pfsdycr", pfscr = "pfscr", atrt = "atrt"){
  fit_cox_uni <- coxph(Surv(pfsdycr, pfscr) ~ atrt, data = tmp)
  summary(fit_cox_uni)
  return(fit_cox_uni)
}

