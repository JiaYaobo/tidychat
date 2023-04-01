#' TidyChat: Code Comment
#' 
#' @param x A character vector, function, or fseq object.
#' @param idea A character vector.
#' @param ... Additional arguments.
#' @return A character vector.
#' @export
#' 

code_comment <- function(x, ...){
    UseMethod("code_comment")
}

prompt_code_cmnt1 <- "Please comment the code below"
prompt_code_cmnt2 <- ", and instantly return code like ```{r} code and comment here``` "

code_comment.character <- function(x, ...){
    what <- paste(prompt_code_cmnt1, prompt_code_cmnt2)
    askgpt.character(x = what)
}

code_comment.function <- function(x, idea, ...){
    what <- paste(prompt_code_cmnt1, prompt_code_cmnt2)
    askgpt.function(x, what)
}

code_comment.fseq <- function(x, idea, ...){
    what <- paste(prompt_code_cmnt1, prompt_code_cmnt2)
    askgpt.fseq(x, what)
}