#' Yeast Systematic to Common Gene Name
#'
#' This is  function named 'yeast_systematic_to_common'
#' which prints takes a systematic yeast gene name and returns the common name.
#'
#'


load("data/yeast_gene_names.RData")
yeast_gene_names[yeast_gene_names == ""] = NA

yeast_systematic_to_common <- function(name_vec) {
  translated_names <- match(name_vec, yeast_gene_names$SystematicName, nomatch=NA)
  translated_names <- yeast_gene_names[translated_names, "Name"]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
