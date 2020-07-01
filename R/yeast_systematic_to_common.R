#' @name yeast systematic to common
#' @title yeast_systematic_to_common
#'
#' @param name_vec a vector of systematic names.
#' @return A vector of common names. If no common name is found, returns systematic name
#' @examples
#' yeast_systematic_to_common("YFL039C")
#'

load("data/yeast_gene_names.RData")

yeast_systematic_to_common <- function(name_vec) {
  translated_names <- yeast_gene_names$Common_name[which(yeast_gene_names$Systematic_name %in% name_vec)]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}



