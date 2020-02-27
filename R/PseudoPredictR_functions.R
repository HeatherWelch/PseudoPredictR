#' A nastyverse function
#'
#' This function creates a pseudo predictor layer based on a classical painting to assess the significance of your climatic and topographical predictors. The output raster will have the same extent and resolution as your input prediction layer.
#' @param pseudoRas character string specifiying which built-in classical painting to use as pseudo predictor. Defaults to fathorse.
#' @param inputRas Your input prediction layer 
#' @param mask Should the output raster be masked to your input data? 
#' @keywords dank
#' @details use pseudoRas="show me" to see all possible arguments for the pseudoRas param
#' @export
#' @return Returns a raster object
#' @examples
#' # Get a fathorse raster that matches the extent and resolution of your prediction layers 
#' layer=raster()
#' a=PseudoLayer(inputRas = layer)
#' plot(a)
#' @import raster
#' @import tidyverse
#' @import glue

PseudoLayer=function(inputRas,pseudoRas="fathorse",mask=F){
  if(pseudoRas=="show me"){
    print("bad_day, barrel, boat, fathorse, headless_horseman, longdog, orange_you_glad, ship")
  } else {
  image=raster(system.file(glue("inst/imgs/{pseudoRas}.jpg"), "PseudoPredictR"))
  extent(image)=extent(inputRas)
  crs(image)=crs(inputRas)
  b=resample(image,inputRas)
  if(mask){b=mask(b,inputRas)}
  return(b)
  }
  
}
