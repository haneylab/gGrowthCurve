context("Metadata imports")

testthat::test_that("Metadata is imported into a data.frame object.", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  meta <- gGrowthCurve::import_metadata(file, well_id = "well")
  testthat::expect_true(is.data.frame(meta))
})

testthat::test_that("import_metadata requires a 'plate_id' column if the multi_plate variable is set to TRUE", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  testthat::expect_error(gGrowthCurve::import_metadata(file, well_id = "well", multi_plate = TRUE))
})

testthat::test_that("An incorrect value for well_id throws an error", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  testthat::expect_error(gGrowthCurve::import_metadata(file, well_id = "well_id"))
})

testthat::test_that("An incorrect value for plate_id throws an error", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  testthat::expect_error(gGrowthCurve::import_metadata(file, well_id = "well", multi_plate = TRUE, plate_id = "plate"))
})

testthat::test_that("import_metadata correctly renames the plate_id column", {
  dir <- gGrowthCurve::gGrowthCurve_example_dir()
  file <- paste0(dir, "/metadata.csv")
  meta <- gGrowthCurve::import_metadata(file, well_id = "well", multi_plate = TRUE, plate_id = "carbon_source")
  testthat::expect_true("plate_id" %in% colnames(meta))
})