analyse <- function(x, ...) {
  UseMethod("analyse")
}


analyse.default <- function(x, what, ...) {
  class_name <- class(x)[1]
  if (substr(class_name, 1, 7) == "summary") {
    what = paste("Please analys the summary with idea:", what)
    askgpt.summary.default(x, what)
  } else {
  what <- paste("Please analyse the data with idea:", what, ",code block should be like ```{r} code here``` ")
  askgpt.default(x, what)
  }
}

analyse.default <- function(x, what, ...) {
    what <- paste("Please analyse the data with idea:", what, ",code block should be like ```{r} code here``` ")
    askgpt.default(x, what)
}

analyse.data.frame <- function(x, what, ...) {
    what <- paste("Please analyse the data with idea:", what, ",code block should be like ```{r} code here``` ")
    askgpt.data.frame(x, what)
}

analyse.table <- function(x, what, ...) {
    what <- paste("Please analyse the data with idea:", what, ",answer me start with and only return code like ```{r} code here``` ")
    askgpt.table(x, what)
}
