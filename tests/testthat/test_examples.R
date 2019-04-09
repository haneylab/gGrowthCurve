context("Example Data")

testthat::test_that("gGrowthCurve example data exists in inst/extdata/", {
  testthat::expect_equal(length(gGrowthCurve::gGrowthCurve_example_dir()), 1)
})