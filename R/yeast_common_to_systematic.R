#' @name yeast common to systematic
#' @title yeast_common_to_systematic
#'
#' @param name_vec a vector of common names.
#' @return A vector of systematic names. If no systematic name is found, returns common name
#' @examples
#' yeast_common_to_systematic("GAP1")
#'

load("data/yeast_gene_names.RData")

yeast_common_to_systematic <- function(name_vec) {
  translated_names <- yeast_gene_names$Systematic_name[which(yeast_gene_names$Common_name %in% name_vec)]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
