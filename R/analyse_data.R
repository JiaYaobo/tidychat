#' @title analyse data
#' @description analyse data
#' @param x data
#' @param prompt idea
#' @param ... additional arguments
#' @return code
#' @export


analyse <- function(x, ...) {
  UseMethod("analyse")
}


#' @export
analyse.default <- function(x, prompt, ...) {
  class_name <- class(x)[1]
  if (substr(class_name, 1, 7) == "summary") {
    prompt = paste("Analyse summary with idea:", prompt)
    return(askgpt.summary.default(x, prompt))
  } else {
  prompt <- paste("Analyse data with idea:", prompt, ",code block should be like ```{r} code here``` ")
  return(askgpt.default(x, prompt))
  }
}

#' @export
analyse.data.frame <- function(x, prompt, ...) {
    prompt <- paste("Analyse data with idea:", prompt, ",code block should be like ```{r} code here``` ")
    askgpt.data.frame(x, prompt)
}

#' @export
analyse.table <- function(x, prompt, ...) {
    prompt <- paste("Analyse data with idea:", prompt, ",answer me start with and only return code like ```{r} code here``` ")
    askgpt.table(x, prompt)
}
