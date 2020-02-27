#' A nastyverse function
#'
#' This function allows you play some nasty beats to accompany your code.
#' @param pseudoRas character string specifiying which built-in classical painting to use as pseudo predictor. Defaults to fathorse.
#' @param inputRas Your prediction layer 
#' @keywords dank
#' @details use pseudoRas="show me" to see all possible arguments for the pseudoRas param
#' @export
#' @examples
#' # Get a fathorse raster that matches the extent, and resolution of your prediction layers 
#' beatr("tubular")
#' # Update all packages and hear Good Morning Vietnam! when it is ready
#' update.packages(ask=FALSE); beatr("ecoroms")
#' @import raster
#' @import tidyverse
#' @import glue

# 
# 
# library(raster)
# library(tidyverse)
# library(glue)
# test=raster("/Users/heatherwelch/Dropbox/benioff_operationalization/operationalization/BenioffRuns/output/blwh_ensemble_2020-02-22.grd")
# a=raster("/Users/heatherwelch/Dropbox/nastyverse/PseudoPredictR/PseudoPredictR/inst/imgs/ship.jpg")
# crs(a)="+proj=longlat +datum=WGS84 +ellps=WGS84 +towgs84=0,0,0 "
# b=resample(a,test)
# 
# # template=raster()
# # values(template)=a
# extent(a)=extent(test)
# crs(a)=crs(test)
# # res(a)=res(test)
# b=resample(a,test)
# 
# 
# b=resample(a,test)
# c=stack(b,test)
# 
# pseudoRas="ship"
# inputRas=test
# a=PseudoLayer(inputRas = inputRas,pseudoRas="fathorse",mask = T)

PseudoLayer=function(inputRas,pseudoRas="fathorse",mask=F){
  if(pseudoRas=="show me"){
    print("bad_day, barrel, boat, fathorse, headless_horseman, longdog, orange_you_glad, ship")
  } else {
  image=raster(glue("inst/imgs/{pseudoRas}.jpg"))
  extent(image)=extent(test)
  crs(image)=crs(test)
  b=resample(image,test)
  if(mask){b=mask(b,test)}
  return(b)
  }
  
}
