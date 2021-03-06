% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bind_plots.R
\name{bind_plots}
\alias{bind_plots}
\title{Bind Multiple ggplot Objects}
\usage{
bind_plots(..., byrow = FALSE)
}
\arguments{
\item{...}{(`ggplot`) ggplot objects to combine.}

\item{byrow}{(`logical`) if FALSE (the default) the plots are bind by
columns, otherwise the plots are bind by rows.}
}
\value{
(`gtable`) A plottable object with \code{plot()}.
}
\description{
This is an aesthetically efficient implementation of the
  \link[gridExtra]{grid.arrange}.
}
\examples{
\dontrun{
library("DALEX")
titanic_glm <- glm(survived ~ gender + age + fare,
                   data = titanic_imputed, family = "binomial")

explain_glm <- explain(titanic_glm,
                       data = titanic_imputed,
                       y = titanic_imputed$survived,
                       verbose = FALSE)

pdp_numerical <- partial_dependence(explain_glm, N = 50, variable_type = "numerical")
pdp_categorical <- partial_dependence(explain_glm, N = 50, variable_type = "categorical")

# Bind plots by rows
bind_plots(plot(pdp_numerical), plot(pdp_categorical), byrow = TRUE)

# Bind plots by columns
bind_plots(plot(pdp_numerical), plot(pdp_categorical), byrow = FALSE)
}

}
