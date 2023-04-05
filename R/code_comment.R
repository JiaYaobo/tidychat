#' TidyChat: Code Comment
#'
#' @param x A character vector, function, or fseq object.
#' @param idea A character vector.
#' @param ... Additional arguments.
#' @return A character vector.
#' @export

#' @export
code_comment <- function(x, ...){
    UseMethod("code_comment")
}

#' @export
code_comment.character <- function(x, ...){
    what <- paste("Comment code below", ", and instantly return code like ```{r} code and comment here``` ")
    askgpt.character(x = what)
}

#' @export
code_comment.function <- function(x, ...){
    what <- paste("Comment code below",", and instantly return code like ```{r} code and comment here``` ")
    askgpt.function(x, what)
}

#' @export
code_comment.fseq <- function(x, ...){
    what <- paste("Comment code below",", and instantly return code like ```{r} code and comment here``` ")
    askgpt.fseq(x, what)
}
