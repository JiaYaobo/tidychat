
#' Create a report
#' @export
create_report <- function(x, format, ...) {
    UseMethod("create_report")
}

#' @export
create_report.default <- function(x, format = "markdown", ...) {
    class_name <- class(x)[1]
    if (substr(class_name, 1, 7) == "summary") {
        prompt <- paste("Create a ", format, " format report for the summary table with statistical language")
        return(askgpt.summary.default(x, prompt))
    } else {
        prompt <- paste("Create a ", format, " format report for this table with statistical language")
        return(askgpt.default(x, prompt))
    }
}

#' @export
create_report.table <- function(x, format = "markdown", ...) {
    prompt <- paste("Create a ", format, " format report for this table with statistical language")
    askgpt.table(x, prompt)
}

#' @export
create_report.data.frame <- function(x, format = "markdown", ...) {
    prompt <- paste("Create a ", format, " format report for this dataframe with statistical language")
    askgpt.data.frame(x, prompt)
}


#' @export
create_report.htest <- function(x, format="markdown", ...){
  prompt <- paste("Please create a ", format, " format report for this hypothesis test result with statistical language")
  askgpt.default(x, prompt)
}
