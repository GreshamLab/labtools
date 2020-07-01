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
#' @examples make_gff_from_snap(input, II, column 1, output.gff)
#' @keywords Grace Avecilla


####here are the variables you should give the function####
#all variables should be characters
#file_path is the name of the csv which has the snapgene feature output
#chromosome is the chromosome the features are on
#feature_source is what you want in the source column
#output is what you want your output gff to be called (should be .gff)
#library(tidyverse)

make_gff_from_snap = function(file_path, chromosome, feature_source, output) {
  #load data, this is a csv with features exported from snapgene
  feats = read_csv(file_path, col_names = F)
  #add column 1:seqid, Column 2: "source", Column 6: "score", Column 8: "phase"
  feats_edit = feats %>% mutate(seqid = chromosome, source = feature_source,
                                score = '.', phase = '.') %>%
    mutate(strand = case_when(X4 == '<=' ~ '-', #add column 7: strand column <= is reverse, == or => is forward
                              X4 == '==' ~ '+',
                              X4 == '=>' ~ '+')) %>%
    separate(X2,c("start",sep="end"),"\\..") %>% #separate out the start and end positions and put in their own columns
    rename(attributes = X1, type = X5) %>% #rename name column to attribute
    select(seqid, source, type, start, end, score, strand, phase, attributes) #reorder columns

  #write file
  write_tsv(feats_edit, path = output, col_names = F)
}
