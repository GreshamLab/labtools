#' @name yeast systematic to common
#' @title yeast_systematic_to_common
#'
#'
#' @examples
#' yeast_systematic_to_common("YFL039C")
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
