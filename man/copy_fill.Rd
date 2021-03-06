% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generic_reshape.r
\name{copy_fill}
\alias{copy_fill}
\title{Copy nodes}
\usage{
copy_fill(
  .tokens,
  from_node,
  to_node,
  subset = NULL,
  subset_fill = NULL,
  only_new = NULL
)
}
\arguments{
\item{.tokens}{A tokenIndex in which nodes are selected with \link{select_nodes}.}

\item{from_node}{The name of the node from which fill is copied}

\item{to_node}{The name of the node to which fill is copied}

\item{subset}{A subset expression (that evaluates to a logical vector). The token column for each labeled node in the tquery can be referred to as label$column.}

\item{subset_fill}{A subset on the fill nodes. Can only directly use token column. For example, use pos == 'VERB' to copy only verbs}

\item{only_new}{If TRUE, direct fill children will only be copied to to_node if it does not already have nodes of this relation. This is a good heuristic for dealing with argument drop.}
}
\value{
A tokenIndex with a .nodes attribute
}
\description{
Copy nodes
}
\examples{
tokens = tokens_spacy[tokens_spacy$doc_id == 'text1',]

tq = tquery(label='object', relation='dobj')
            
tokens2 = select_nodes(tokens, tq)
selected_nodes(tokens2)

tokens3 = copy_nodes(tokens2, 'object', 'new_object')
copy_fill(tokens3, 'object', 'new_object')
}
