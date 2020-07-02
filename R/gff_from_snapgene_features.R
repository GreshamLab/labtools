#' Make a gff from a snap gene file
#'
#' this is a function that takes a csv with features generated from snapgene, and converts it into a gff format
#' when exporting features from snapgene, export all feature data (csv should have 5 columns)
#'
#' @param file_path the file_path is the name of the csv which has the snapgene feature output
#' @param chromosome is the chromosome the features are on.
#' @param feature_source is what you want in the source column
#' @param output is what you want your output gff to be called (should be .gff)
#' @return A file formatted as a gff
#' @examples make_gff_from_snap(input,chr2, column1, output.gff)
#' @author Grace Avecilla \email{ga824@@nyu.edu }
#' @importFrom magrittr %>%
#' @importFrom readr read_csv
#' @importFrom dplyr mutate
#' @importFrom tidyr separate
#' @importFrom dplyr rename
#' @importFrom dplyr select
#' @importFrom readr write_tsv
#' @export

make_gff_from_snap = function(file_path, chromosome, feature_source, output) {
  feats = readr::read_csv(file_path, col_names = F)
  feats_edit = feats %>% dyplr::mutate(seqid = chromosome, source = feature_source,
                                score = '.', phase = '.') %>%
    dplyr::mutate(strand = dplyr::case_when(X4 == '<=' ~ '-',
                                            X4 == '==' ~ '+',
                                            X4 == '=>' ~ '+')) %>%
    tidyr::separate(X2,c("start",sep="end"),"\\..") %>%
    dplyr::rename(attributes = X1, type = X5) %>%
    dplyr::select(seqid, source, type, start, end, score, strand, phase, attributes)

  readr::write_tsv(feats_edit, path = output, col_names = F)
}
