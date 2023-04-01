create_report <- function(x, format, ...) {
    UseMethod("create_report")
}

create_report.default <- function(x, format = 'markdown', ...) {
    class_name <- class(x)[1]
    if (substr(class_name, 1, 7) == "summary") {
        what = paste("Please create a ", format, " format text for this summary table to me with statistical language")
        askgpt.summary.default(x, what)
    } else {
        what = paste("Please create a ", format, " format text for this table to me with statistical language")
        askgpt.default(x, what)
    }
}

create_report.table <- function(x, format='markdown', summarized=FALSE, ...) {
    what = paste("Please create a ", format, " format text for this table to me with statistical language")
    askgpt.table(x, what, summarized)
}

create_report.data.frame <- function(x, format='markdown', summarized=FALSE,...) {
    what = paste("Please create a ", format, " format text for this dataframe to me with statistical language")
    askgpt.data.frame(x, what, summarized)
}
