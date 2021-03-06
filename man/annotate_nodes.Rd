% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotate.r
\name{annotate_nodes}
\alias{annotate_nodes}
\title{Annotate a tokenlist based on rsyntaxNodes}
\usage{
annotate_nodes(tokens, nodes, column)
}
\arguments{
\item{tokens}{A tokenIndex data.table, or any data.frame coercible with \link{as_tokenindex}.}

\item{nodes}{An rsyntaxNodes A data.table, as created with \link{apply_queries}. Can be a list of multiple data.tables.}

\item{column}{The name of the column in which the annotations are added. The unique ids are added as [column]_id, and the fill values are added as [column]_fill.}
}
\value{
The tokenIndex data.table with the annotation columns added
}
\description{
Use rsyntaxNodes, as created with \link{tquery} and \link{apply_queries}, to annotate a tokenlist.
Three columns will be added: a unique id for the query match, the labels assigned in the tquery, and a column with the fill level (0 is direct match, 1 is child of match, 2 is grandchild, etc.).
}
\details{
Note that you can also directly use \link{annotate}.
}
\examples{
## spacy tokens for: Mary loves John, and Mary was loved by John
tokens = tokens_spacy[tokens_spacy$doc_id == 'text3',]

## two simple example tqueries
passive = tquery(pos = "VERB*", label = "predicate",
                 children(relation = c("agent"), label = "subject"))
active =  tquery(pos = "VERB*", label = "predicate",
                 children(relation = c("nsubj", "nsubjpass"), label = "subject"))

nodes = apply_queries(tokens, pas=passive, act=active)
annotate_nodes(tokens, nodes, 'clause')
}
