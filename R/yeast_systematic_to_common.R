#' Yeast Systematic to Common Gene Name
#'
#' This is  function named 'yeast_systematic_to_common'
#' which prints takes a systematic yeast gene name and returns the common name.
#'

yeast.gene.names <- read.table(file.path(WORKING.PATH, DATA.PATH, GENE.NAME.FILE), sep = "\t", quote="", header=TRUE, stringsAsFactors = FALSE)
yeast.gene.names[yeast.gene.names == ""] = NA

yeast_systematic_to_common <- function(name.vec) {
  translated.names <- match(name.vec, yeast.gene.names$SystematicName, nomatch=NA)
  translated.names <- yeast.gene.names[translated.names, "Name"]
  no.translation <- is.na(translated.names)
  translated.names[no.translation] <- name.vec[no.translation]
  return(translated.names)
}
