askgpt <- function(x, ...) {
    UseMethod("askgpt")
}

askgpt.default <- function(x, what, ...){
    string <- paste(capture.output(str(x)), collapse = "\n")
    request(paste(what, "\n", string, sep = ""))$choices[[1]]$message$content
}

askgpt.function <- function(x, what, ...) {
    func_string <- paste(capture.output(x), collapse = "\n")
    request(paste(what, "\n", func_string, sep = ""))$choices[[1]]$message$content
}

askgpt.fseq <- function(x, what, ...) {
    fseq_string <- paste(capture.output(x), collapse = "\n")
    request(paste(what, "\n", fseq_string, sep = ""))$choices[[1]]$message$content
}

askgpt.data.frame <- function(x, what) {
    df_string <- paste(capture.output(glimpse(x)), collapse = "\n")
    request(paste(what, " ", ",given the data below", "\n", df_string, sep = ""))$choices[[1]]$message$content
}

askgpt.table <- function(x, what) {
    summary_string <- paste(capture.output(str(x)), collapse = "\n")
    request(paste(what, "\n", summary_string, sep = ""))$choices[[1]]$message$content
}

askgpt.summary.default <- function(x, what, ...) {
    summary_string <- paste(capture.output(x), collapse = "\n")
    request(paste(what, "\n", summary_string, sep = ""))$choices[[1]]$message$content
}

askgpt.character <- function(x, ...) {
    string <- paste(capture.output(x), collapse = "\n")
    request(paste(string, sep = ""))$choices[[1]]$message$content
}
