#' import_curve
#'
#' This function imports all of the data required by gGrowthCurve to graph plate reader output.
#'
#' import_curve
#' @param file The file output from the plate reader. Make sure it is saved as a csv.
#' @param metadat This file contains information about the contents of each well
#' @param ... Other params for data.table::fread()
#' @export
import_curve <- function(file, metadat, index, ...) {
  dat <- data.table::fread(file = file, ...)
  dat[,2] <- NULL
  dat$Time <- unlist(lapply(dat$Time, parse_time))
  
  metadat <- import_metadata(metadat, ...)
  
  tidy_dat <- tidyr::gather(dat, key = "well_id", value = "OD", -1)
  
  final_data <- dplyr::left_join(tidy_dat, metadat, by = "well_id")

  return(final_data)
}


import_metadata <-
  function(file,
           well_id = "well",
           ...) {
    metadat <- data.table::fread(file = file, ...)
    if (!(well_id %in% colnames(metadat))) {
      stop("The column name you entered for well_id doesn't exist in the metadata file")
    }
    else {
      colnames(metadat)[colnames(metadat) == well_id] <- "well_id"
    }
    
    return(metadat)
  }


parse_time <-
  function(time) {
    split_time <- as.numeric(unlist(strsplit(time, c("\\.|:"))))
    if (length(split_time) == 4) {
      secs <-
        sum(split_time[4],
            (60 * split_time[3]),
            (3600 * split_time[2]),
            (86400 * split_time[1]))
    }
    else{
      secs <-
        sum(split_time[3], (60 * split_time[2]), (3600 * split_time[1]))
    }
    return(secs)
  }
