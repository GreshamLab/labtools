#' @name yeast_systematic_to_sgd
#' @title yeast_systematic_to_sgd
#'
#' @param name_vec a vector of systematic names.
#' @return A vector of SGD IDs (format: SGD:SNNNNNNNNN). If no SGD ID is found, returns systematic name
#' @examples
#' yeast_systematic_to_sgd("YHL016C")
#'

load("data/yeast_gene_names.RData")

yeast_systematic_to_sgd <- function(name_vec) {
  translated_names <- match(name_vec, yeast_gene_names$Systematic_name, nomatch=NA)
  translated_names <- yeast_gene_names[translated_names, "SGD_ID"]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
