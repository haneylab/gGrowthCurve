#' import_metadata
#' 
#' This function allows users to import metadata that will be used for downstream analyses. 
#' 
#' @param file Metadata file to be imported. Must contain a column containing well IDs (A1, A2...)
#' @param well_id The name of the column in your metadata table with locations on the plate
#' @param multi_plate If you will be using multiple plates, set this to TRUE
#' @param plate_id If you are analyzing multiple plates, this variable is the name of the column in your metadata table where you store plate_ids
#' @param ... Additional parameters for for data.table::fread()
#' @inherit data.table::fread()
#' @export 
import_metadata <- function(file, well_id="well_id", multi_plate=FALSE, plate_id=NULL, ...){
  metadat <- data.table::fread(file)
  if(!(well_id %in% colnames(metadat))){stop("The column name you entered for well_id does not exist in this metadata table")}
  else {colnames(metadat)[colnames(metadat)==well_id] <- "well_id"}
  
  if(multi_plate == TRUE){
    if(is.null(plate_id)){stop("You must include a plate_id column in your metatdata file if you want to analyze multiple plates")}
    else if(!(plate_id %in% colnames(metadat))){stop("The column name you entered for plate_id does not exist in this metadata table")}
    else {colnames(metadat)[colnames(metadat) == plate_id] <- "plate_id"}
  }
  return(metadat)
}