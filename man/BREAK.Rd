% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tquery.r
\name{BREAK}
\alias{BREAK}
\title{A special NOT condition if depth > 1}
\usage{
BREAK(...)
}
\arguments{
\item{...}{name-value pairs for look-up terms. see ?query.}
}
\value{
A list, to be used as input to \link{tquery}
}
\description{
If depth > 1 in the children, parents or fill function, the children/parents will
be retrieved recursively (i.e. children, children of children, etc.).
If the look-up conditions (e.g., relation = 'nsubj') are not satisfied, a node 
will not be matched by the query, but the search will still continue for it's
parents/children. The special BREAK look-up function allows you to specify a condition
for breaking the recursive loop (lending it's name from the `break` in a for loop).
An example is that you might want to stop the recursive loop in a custom_fill() once it encounters
a nested sentence, such as a relative clause: custom_fill(BREAK(relation = 'relcl')).
}
\examples{
tquery(NOT(POS='Noun'))  
}
