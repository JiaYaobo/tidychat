code_completion <- function(x, ...){
    UseMethod("code_completion")
}

code_completion.character <- function(x, ...){
    what <- paste("Please complete the code with the idea:", x, ",answer me start with and only return code like ```{r} code here```")
    askgpt.character(x = what)
}

code_completion.function <- function(x, idea, ...){
    what <- paste("Please complete the code with the idea:", ",answer me start with and only return code like ```{r} code here```")
    askgpt.function(x, what)
}

code_completion.fseq <- function(x, idea, ...){
    what <- paste("Please complete the code with the idea:", idea, ",answer me start with and only return code like ```{r} code here```")
    askgpt.fseq(x, what)
}
