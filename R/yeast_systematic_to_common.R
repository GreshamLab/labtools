#' @name yeast_systematic_to_common
#' @title yeast_systematic_to_common
#'
#' @param name_vec a vector of systematic names.
#' @return A vector of common names. If no common name is found, returns systematic name
#' @examples
#' yeast_systematic_to_common("YFL039C")
#'
#' @export

load("data/yeast_gene_names.RData")

yeast_systematic_to_common <- function(name_vec) {
  translated_names <- match(name_vec, yeast_gene_names$Systematic_name, nomatch=NA)
  translated_names <- yeast_gene_names[translated_names, "Common_name"]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}



