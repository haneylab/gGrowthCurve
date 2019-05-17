#' import_curve
#'
#' This function imports all of the data required by gGrowthCurve to graph plate reader output. 
#'
#' import_curve
#' @param file The file output from the plate reader. Make sure it is saved as a csv. 
#' @param metadat This file contains information about the contents of each well
#'
#'
#' import_metadata
#' This background function imports metadata that will be used for downstream analyses.
#'
#' @param file Metadata file to be imported. Must contain a column containing well IDs (A1, A2...)
#' @param well_id The name of the column in your metadata table with locations on the plate
#' @param multi_plate If you will be using multiple plates, set this to TRUE
#' @param plate_id If you are analyzing multiple plates, this variable is the name of the column in your metadata table where you store plate_ids
#' @param ... Additional parameters for for data.table::fread()
#' @inherit data.table::fread()


import_metadata <-
  function(file,
           well_id = "well_id",
           ...) {
    metadat <- data.table::fread(file)
    if (!(well_id %in% colnames(metadat))) {
      stop("The column name you entered for well_id doesn't exist in the metadata file")
    }
    else {
      colnames(metadat)[colnames(metadat) == well_id] <- "well_id"
    }
    
    return(metadat)
  }
