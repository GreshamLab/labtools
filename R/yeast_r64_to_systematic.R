#' @name yeast_r64_to_systematic
#' @title yeast_r64_to_systematic
#'
#' @param name_vec a vector of GCF_000146045.2_R64_genomic IDs (format: ID=cdsNN).
#' @return A vector of systematic names. If no systematic name is found, returns GCF_000146045.2_R64_genomic ID
#' @examples
#' yeast_r64_to_systematic("ID=cds2818")
#'

load("data/yeast_gene_names.RData")

yeast_r64_to_systematic <- function(name_vec) {
  translated_names <- match(name_vec, yeast_gene_names$GCF_000146045.2_R64_genomic_ID, nomatch=NA)
  translated_names <- yeast_gene_names[translated_names, "Systematic_name"]
  no_translation <- is.na(translated_names)
  translated_names[no_translation] <- name_vec[no_translation]
  return(translated_names)
}
