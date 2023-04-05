#' Ask Chatgpt for an answer
#'
#' @param x what you want to ask 
#' @param prompt your prompt
#' @param ... additional arguments
#' @return chatgpt answer
#'
#' @export
askgpt <- function(x, ...) {
    UseMethod("askgpt")
}

#' @export
askgpt.default <- function(x, prompt=NULL, ...) {
    class_name = class(x)[1]
    if (substr(class_name, 1, 7) == "summary") {
      return(askgpt.summary.default(x, prompt))
    }
    desc <- paste(capture.output(x), collapse = "\n")
    request(paste(prompt, "\n", desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.function <- function(x, prompt, ...) {
    func_desc <- paste(capture.output(x), collapse = "\n")
    request(paste(prompt, "\n", func_desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.fseq <- function(x, prompt, ...) {
    out_desc <- capture.output(x)
    len <- length(out_desc)
    sub_desc <- out_desc[3:(len - 2)]
    fseq_desc <- paste(sub_desc, collapse = "\n")
    fseq_desc <- paste("given description below is a sequence of functions piped with %>%: \n", fseq_desc)
    request(paste(prompt, "\n", fseq_desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.data.frame <- function(x, prompt, summarized=FALSE) {
    if (summarized == TRUE){
        return(askgpt.summary.default(x, prompt))
    }
    row_names <- rownames(x)
    if (is.null(row_names)) row_names <- "not given"
    col_names <- colnames(x)
    if (is.null(col_names)) col_names <- "not given"
    types <- sapply(x, class)
    df_desc <- paste(
        "given the data frame with", length(row_names),
        "rows and", length(col_names),
        "columns, and the column names are", paste(col_names, collapse = ", "),
        ", and the row names are", paste(row_names, collapse = ", "),
        ", and the types of the columns are", paste(types, collapse = ", ")
    )

    request(paste(prompt, " ", ",given description below:", "\n", df_desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.table <- function(x, prompt, summarized=FALSE) {
    if (summarized == TRUE){
      return(askgpt.summary.default(x, prompt))
    }
    row_names <- rownames(x)
    if (is.null(row_names)) row_names <- "not given"
    col_names <- colnames(x)
    if (is.null(col_names)) col_names <- "not given"
    types <- sapply(x, class)[1]
    table_desc <- paste(
        "given the table with", length(row_names),
        "rows and", length(col_names),
        "columns, and the column names are", paste(col_names, collapse = ", "),
        ", and the row names are", paste(row_names, collapse = ", "),
        ", and the type of the value is", paste(types, collapse = ", ")
    )
    request(paste(prompt, "\n", table_desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.summary.default <- function(x, prompt, ...) {
    summary_desc <- paste(capture.output(x), collapse = "\n")
    request(paste(prompt, "\n", summary_desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.character <- function(x, prompt=NULL, ...) {
  desc <- paste(capture.output(x), collapse = "\n")
  request(paste(desc, sep = ""))$choices[[1]]$message$content
}

#' @export
askgpt.htest <- function(x, prompt=NULL, ...) {
    desc <- paste(capture.output(x), collapse = "\n")
    request(paste(desc, sep = ""))$choices[[1]]$message$content
}
