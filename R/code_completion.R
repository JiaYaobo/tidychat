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
    prompt <- paste("Please complete the code with the idea:", x, ",answer me start with and only return code like ```{r} code here```")
    askgpt.character(x = prompt)
}

#' @export
code_completion.function <- function(x, idea, ...){
    if (is.null(idea)) {
        prompt <- paste("Please complete the code and answer me start with and only return code like ```{r} code here```")
    }else {
        prompt <- paste("Please complete the code with the idea:", idea, ",answer me start with and only return code like ```{r} code here```")
    }
    askgpt.function(x, prompt)
}

#' @export
code_completion.fseq <- function(x, idea=NULL, ...){
    if (is.null(idea)) {
        prompt <- paste("Please complete the code and answer me start with and only return code like ```{r} code here```")
    }else {
        prompt <- paste("Please complete the code with the idea:", idea, ",answer me start with and only return code like ```{r} code here```")
    }
    askgpt.fseq(x, prompt)
}
