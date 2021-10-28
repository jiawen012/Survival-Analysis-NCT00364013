# homework-1
This is created R package from homework 1.

There are three cleaned dataset: data_cleaned, dl and tmp. The dataset named "dl" is the data that directly read and combined from NCT00364013, while\
data_cleaned is the data set after dropping useless variables and processing dummy variables. The dataset named "tmp" is the data that I finally used for ploting and survival analysis\

Also, here are several functions. You can use them in the following ways to get a thorough understand of my work in homework 1.
```
library(homework-1)

# exploratory analysis
summarize_table(data_cleaned)
plot_trt(tmp)
plot_panels(tmp)
plot_hist(tmp)

# survival analysis
survival_fit(tmp)
plot_survival(survival_fit(tmp)
summarize_cox(tmp)
```
