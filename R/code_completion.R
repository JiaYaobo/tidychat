#' Code Completion
#'
#' @param x A character vector, function, or fseq object.
#' @param idea A character vector.
#' @param ... Additional arguments.
#' @return A character vector.
#' @export

code_completion <- function(x, ...){
    UseMethod("code_completion")
}

#' @export
code_completion.character <- function(x, ...){
    prompt <- paste("Complete code with idea:", x, ",answer me start with and only return code like ```{r} code here```")
    askgpt.character(x = prompt)
}

#' @export
code_completion.function <- function(x, idea=NULL, ...){
    if (is.null(idea)) {
        prompt <- paste("Complete code and answer me start with and only return code like ```{r} code here```")
    }else {
        prompt <- paste("Complete code with idea:", idea, ",answer me start with and only return code like ```{r} code here```")
    }
    askgpt.function(x, prompt)
}

#' @export
code_completion.fseq <- function(x, idea=NULL, ...){
    if (is.null(idea)) {
        prompt <- paste("Complete code and answer start with and only return code like ```{r} code here```")
    }else {
        prompt <- paste("Complete code with idea:", idea, ",answer start with and only return code like ```{r} code here```")
    }
    askgpt.fseq(x, prompt)
}
