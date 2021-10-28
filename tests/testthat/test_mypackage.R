test_that("test summary table:", {
  expect_equal(length(summarize_table(data_cleaned)), 96)
  expect_equal(class(summarize_table(data_cleaned)), "table")
  expect_equal(summarize_table(data_cleaned)[1], "0:468  ")
  expect_equal(summarize_table(data_cleaned)[50], "1:579  ")
  expect_equal(summarize_table(data_cleaned)[96], "Max.   :466.0  ")
})

test_that("test treatment plot:", {
  expect_equal(class(plot_trt(tmp))[1], "gg")
  expect_equal(class(plot_trt(tmp))[2], "ggplot")
  expect_equal(class(plot_panels(tmp)), "NULL")
  expect_equal(class(plot_hist(tmp))[1], "gg")
  expect_equal(class(plot_hist(tmp))[2], "ggplot")
})

test_that("test survival analysis:", {
  expect_equal(class(survival_fit(tmp)), "survfit")
  expect_equal(length(survival_fit(tmp)), 17)
  expect_equal(class(survival_fit(tmp))[1], "survfit")
  expect_equal(class(survival_fit(tmp))[2], "NA")
  expect_equal(class(plot_survival(survival_fit(tmp))[1]), "list")
  expect_equal(class(summarize_cox(tmp)), "coxph")
})
