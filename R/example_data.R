#' gGrowthCurve_example
#' 
#' gGrowthCurve includes example data in its `inst/extdata` directory. 
#' 
#' @param path Name of the file. If `NULL`, it will list all files in `extdata`.
#' @export
#' @examples
#' # list all files
#' gGrowthCurve_example()

gGrowthCurve_example <- function(path = NULL) {
  if (is.null(path)) {
    dir(system.file("extdata", package = "gGrowthCurve"))
  } else {
    system.file("extdata", path, package = "gGrowthCurve", mustWork = TRUE)
  }
}

#' @rdname gGrowthCurve_example
#' @export
gGrowthCurve_example_dir <- function(){
  system.file("extdata", package = "gGrowthCurve")}
