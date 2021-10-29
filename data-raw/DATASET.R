## code to prepare dataset goes here. dl is origin dataframe, data_cleaned is what I used for analysis, while tmp is what I used for draw plots

library(haven)
library(dplyr)
library(tibble)
library(purrr)
library(tidyr)
library(ggplot2)
library(dummies)
library(trelliscopejs)
setwd("~/Desktop/BIS 620 DS Software/homework1/data")
fns <- dir("NCT00364013")
fns <- fns[grep("sas7bdat", fns)]
dl <- map(fns, ~ read_sas(file.path("NCT00364013", .x)))
prefix <- gsub(".sas7bdat", "", fns)
names(dl) <- prefix

usethis::use_data(dl, overwrite = TRUE)

#################################################
library(survival)
library(survminer)
library(ranger)
library(ggplot2)
library(dplyr)
library(ggfortify)
library(psych)

fns <- dir("NCT00364013")
fns <- fns[grep("sas7bdat", fns)]
dl <- map(fns, ~ read_sas(file.path("NCT00364013", .x)))
prefix <- gsub(".sas7bdat", "", fns)
names(dl) <- prefix
atrt = dummy(dl$adsl_pds2019$ATRT)
prsurg = dummy(dl$adsl_pds2019$PRSURG)
dth = dl$adsl_pds2019$DTH
age = dl$adsl_pds2019$AGE
dthdy = dl$adsl_pds2019$DTHDY
sex = dummy(dl$adsl_pds2019$SEX)
trt = dl$adsl_pds2019$TRT
ecog = dummy(dl$adsl_pds2019$B_ECOG)
pfscr =dl$adsl_pds2019$PFSCR
pfsdycr = dl$adsl_pds2019$PFSDYCR
colo <- data.frame(
  atrt=atrt,
  dthdy = dthdy,
  dth = dth,
  prsurg = prsurg,
  age = age,
  sex = sex,
  ecog = ecog,
  pfscr = pfscr,
  pfsdycr = pfsdycr
)
data_cleaned = cbind(atrt, dthdy, prsurg, dth, age, sex, trt, ecog, pfscr, pfsdycr)

usethis::use_data(data_cleaned, overwrite = TRUE)

height = dl$adsl_pds2019$B_HEIGHT
weight = dl$adsl_pds2019$B_WEIGHT
race = dl$adsl_pds2019$RACE
tmp <- data.frame(
  dth =dth,
  dthdy = dthdy,
  trt = trt,
  atrt = atrt[,1],
  race = race,
  age = age,
  weight = weight,
  height = height,
  pfscr = pfscr,
  pfsdycr = pfsdycr
)
tmp$dth <- factor(tmp$dth, labels = c("alive", "death"))
tmp$race<-factor(tmp$race,labels=c(''))
tmp$trt<-factor(tmp$trt,labels=c('standard','test'))

usethis::use_data(tmp, overwrite = TRUE)

