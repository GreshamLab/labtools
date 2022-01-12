#' Do both hierarchical clustering with hclust
#' And also louvain clustering with igraph
#'
#' @param data A matrix or dataframe to be clustered on rows
#' @param nearest.neighbors The number of neighbors to keep for the knn.graph
#' @param dist.method The distance method (see 'dist')
#' @param hclust.method The hclust method (see 'hclust)
#' @param knn.graph An igraph graph object which will be used instead of k-NN inverse distance for louvain clustering
#' @param row.name The name used for rows in the louvain dataframe
#' 
#' @return An hclust object with an additional 'louvain' attribute (that )
#'
#' @importFrom igraph cluster_louvain graph.adjacency
#' @export
#' 
hclust.and.louvain <- function(data, nearest.neighbors=25, dist.method="euclidean", hclust.method="average", knn.graph=NULL, row.name="Gene") {
  
  cut.knn <- function(x, nn) {c <- x[order(x)][min(nn, length(x))]; x[x > c] <- NA; return(x)}
  
  # Distance matrix & 100-NN graph adjacency matrix (inverse distance weight)
  dist.obj <- dist(data, method = dist.method)
  
  if (is.null(knn.graph)) {
    cut.distances <- as.matrix(dist.obj)
    cut.distances[upper.tri(cut.distances, diag = T)] <- NA
    cut.distances <- apply(cut.distances, 1, cut.knn, nn=nearest.neighbors)
    cut.distances <- 1 / cut.distances
    cut.distances[is.na(cut.distances)] <- 0
    knn.graph <- graph.adjacency(cut.distances, mode = "undirected", weighted = TRUE, diag = TRUE)
  }

  # Louvain clustering 
  lou.cluster <- cluster_louvain(knn.graph)
  gene.clusters <- data.frame(rownames(data), 0)
  colnames(gene.clusters) <- c(row.name, "Cluster")
  for (i in 1:length(lou.cluster)) {gene.clusters[gene.clusters[, row.name] %in% lou.cluster[[i]], "Cluster"] <- i}
  
  # Heirarchial clustering
  hclust.obj <- hclust(dist.obj, method = hclust.method)
  hclust.obj$louvain <- gene.clusters
  return(hclust.obj)
}
