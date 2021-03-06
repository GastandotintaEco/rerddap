% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/search.R
\name{ed_search}
\alias{ed_search}
\alias{ed_datasets}
\title{Search for ERDDAP tabledep or griddap datasets}
\usage{
ed_search(
  query,
  page = NULL,
  page_size = NULL,
  which = "griddap",
  url = eurl(),
  ...
)

ed_datasets(which = "tabledap", url = eurl())
}
\arguments{
\item{query}{(character) Search terms}

\item{page}{(integer) Page number}

\item{page_size}{(integer) Results per page}

\item{which}{(character) One of tabledep or griddap.}

\item{url}{A URL for an ERDDAP server. Default:
\url{https://upwell.pfeg.noaa.gov/erddap/}. See \code{\link[=eurl]{eurl()}} for
more information}

\item{...}{Curl options passed on to \link[crul:verb-GET]{crul::verb-GET} (must be
named parameters)}
}
\description{
Search for ERDDAP tabledep or griddap datasets
}
\examples{
\dontrun{
(out <- ed_search(query='temperature'))
out$alldata[[1]]
(out <- ed_search(query='size'))
out$info

# List datasets
ed_datasets('table')
ed_datasets('grid')

# use a different ERDDAP server
## Marine Institute (Ireland)
ed_search("temperature", url = "http://erddap.marine.ie/erddap/")
}
}
\references{
\url{https://upwell.pfeg.noaa.gov/erddap/index.html}
}
\author{
Scott Chamberlain \href{mailto:myrmecocystus@gmail.com}{myrmecocystus@gmail.com}
}
