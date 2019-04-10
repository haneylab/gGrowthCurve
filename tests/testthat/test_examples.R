context("Example Data")

testthat::test_that("gGrowthCurve inst/extdata/ contains the correct number of files", {
  testthat::expect_equal(length(gGrowthCurve::gGrowthCurve_example()), 2)
})

testthat::test_that("The files in /extdata/ are correct", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  files <- c("/example_GrowthCurve.csv", "/metadata.csv")
  testthat::expect_true(all(file.exists(paste0(dir, files))))
})
