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
  # ras_path <- file.path(find.package("PseudoPredictR"), "inst/imgs", glue("{pseudoRas}.jpg"))
  # image=raster(ras_path)
    
  raw=system.file("extdata", glue("{pseudoRas}.jpg"), package = "PseudoPredictR")
  image=raster(raw)
  extent(image)=extent(inputRas)
  crs(image)=crs(inputRas)
  b=resample(image,inputRas)
  if(mask){b=mask(b,inputRas)}
  return(b)
  }
  
}




# creating readme files
# layer=raster()
# images=c("bad_day", "barrel", "boat", "fathorse", "headless_horseman", "longdog", "orange_you_glad", "ship")
# for(image in images){
#   a=PseudoLayer(inputRas = layer,pseudoRas = image)
#   
#   map=rasterVis::gplot(a,maxpixels=300000)+geom_tile(aes(fill=value))+
#     scale_fill_gradientn(colours = pals::parula(100),na.value="black")+
#     coord_equal()+ theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())+
#     scale_y_continuous(expand = c(0,0),limits = c(-90,90)) + 
#     scale_x_continuous(expand = c(0,0),limits = c(-180,180)) +theme_void()+theme(legend.position = "none") 
#   
#   map
#   
#   png(glue("/Users/heatherwelch/Dropbox/nastyverse/PseudoPredictR/PseudoPredictR/inst/imgs/{image}.png"),width=36,height=20,units='cm',res=400)
#   par(ps=10)
#   par(mar=c(1,1,1,1))
#   par(cex=1)
#   print({map})
#   dev.off()
# }
# 
