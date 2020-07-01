#' @name yeast systematic to SGD ID
#' @title yeast_systematic_to_sgd
#'
#' @param name_vec a vector of systematic names.
#' @return A vector of SGD IDs (format: SGD:SNNNNNNNNN). If no SGD ID is found, returns systematic name
#' @examples
#' yeast_systematic_to_sgd("YHL016C")
#'

load("data/yeast_gene_names.RData")

yeast_systematic_to_sgd <- function(name_vec) {
  translated_names <- yeast_gene_names$SGD_ID[which(yeast_gene_names$Systematic_name %in% name_vec)]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
