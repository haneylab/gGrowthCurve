context("Metadata imports")

testthat::test_that("Metadata is imported into a data.frame object.", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  meta <- gGrowthCurve:::import_metadata(file, well_id = "well")
  testthat::expect_true(is.data.frame(meta))
})


testthat::test_that("An incorrect value for well_id throws an error", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  testthat::expect_error(gGrowthCurve:::import_metadata(file, well_id = "well_id"))
})
