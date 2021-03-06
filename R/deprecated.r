#' Annotate a tokenlist based on rsyntax queries
#'
#' This function has been renamed to annotate_tqueries.
#'
#' Apply queries to extract syntax patterns, and add the results as two columns to a tokenlist.
#' One column contains the ids for each hit. The other column contains the annotations.
#' Only nodes that are given a name in the tquery (using the 'label' parameter) will be added as annotation.
#' 
#' Note that while queries only find 1 node for each labeld component of a pattern (e.g., quote queries have 1 node for "source" and 1 node for "quote"), 
#' all children of these nodes can be annotated by settting fill to TRUE. If a child has multiple ancestors, only the most direct ancestors are used (see documentation for the fill argument).
#' 
#' @param tokens      A tokenIndex data.table, or any data.frame coercible with \link{as_tokenindex}.
#' @param column      The name of the column in which the annotations are added. The unique ids are added as column_id
#' @param ...         One or multiple tqueries, or a list of queries, as created with \link{tquery}. Queries can be given a named by using a named argument, which will be used in the annotation_id to keep track of which query was used. 
#' @param block       Optionally, specify ids (doc_id - sentence - token_id triples) that are blocked from querying and filling (ignoring the id and recursive searches through the id). 
#' @param fill        Logical. If TRUE (default) also assign the fill nodes (as specified in the tquery). Otherwise these are ignored 
#' @param overwrite   If TRUE, existing column will be overwritten. Otherwise (default), the exsting annotations in the column will be blocked, and new annotations will be added. This is identical to using multiple queries.
#' @param block_fill  If TRUE (and overwrite is FALSE), the existing fill nodes will also be blocked. In other words, the new annotations will only be added if the 
#' @param copy        If TRUE (default), the data.table is copied. Otherwise, it is changed by reference. Changing by reference is faster and more memory efficient, but is not predictable R style, so is optional. 
#' @param verbose     If TRUE, report progress (only usefull if multiple queries are given)
#' 
#' @export
#' @return The tokenIndex with the annotation columns
#' @examples
#' ## spacy tokens for: Mary loves John, and Mary was loved by John
#' tokens = tokens_spacy[tokens_spacy$doc_id == 'text3',]
#' 
#' ## two simple example tqueries
#' passive = tquery(pos = "VERB*", label = "predicate",
#'                  children(relation = c("agent"), label = "subject"))
#' active =  tquery(pos = "VERB*", label = "predicate",
#'                  children(relation = c("nsubj", "nsubjpass"), label = "subject"))
#' 
#' \donttest{ 
#' tokens = annotate_tqueries(tokens, "clause", pas=passive, act=active)
#' tokens
#' if (interactive()) plot_tree(tokens, annotation='clause')
#' }
annotate <- function(tokens, column, ..., block=NULL, fill=TRUE, overwrite=FALSE, block_fill=FALSE, copy=TRUE, verbose=FALSE) {
  .Deprecated('annotate_tqueries')
  annotate_tqueries(tokens=tokens, column=column, ..., block=block, fill=fill, overwrite=overwrite, block_fill=block_fill, copy=copy, verbose=verbose)
}