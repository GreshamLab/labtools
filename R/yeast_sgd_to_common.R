#' @name yeast SGD ID to common
#' @title yeast_sgd_to_common
#'
#' @param name_vec a vector of SGD IDs (format: SGD:SNNNNNNNNN).
#' @return A vector of common names. If no common name is found, returns SGD ID
#' @examples
#' yeast_sgd_to_common("SGD:S000005086")
#'

load("data/yeast_gene_names.RData")

yeast_sgd_to_common <- function(name_vec) {
  translated_names <- yeast_gene_names$Common_name[which(yeast_gene_names$SGD_ID %in% name_vec)]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
