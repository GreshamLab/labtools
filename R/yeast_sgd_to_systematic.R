#' @name yeast_sgd_to_systematic
#' @title yeast_sgd_to_systematic
#'
#' @param name_vec a vector of SGD IDs (format: SGD:SNNNNNNNNN).
#' @return A vector of systematic names. If no systematic name is found, returns SGD ID
#' @examples
#' yeast_sgd_to_systematic("SGD:S000000979")
#'
#' @export

load("data/yeast_gene_names.RData")

yeast_sgd_to_systematic <- function(name_vec) {
  translated_names <- match(name_vec, yeast_gene_names$SGD_ID, nomatch=NA)
  translated_names <- yeast_gene_names[translated_names, "Systematic_name"]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
