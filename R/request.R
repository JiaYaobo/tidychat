request <- function(prompt, openai_api_key=Sys.getenv("OPENAI_API_KEY")){
  if (nchar(openai_api_key) == 0) {
    stop("`OPENAI_API_KEY` not provided.")
  }
  model <- Sys.getenv("OPENAI_MODEL", "gpt-3.5-turbo")
  params <- list(
    model = model,
    max_tokens = as.numeric(Sys.getenv("OPENAI_MAX_TOKENS", 256)),
    temperature = as.numeric(Sys.getenv("OPENAI_TEMPERATURE", 1)),
    top_p = as.numeric(Sys.getenv("OPENAI_TOP_P", 1)),
    frequency_penalty = as.numeric(Sys.getenv("OPENAI_FREQUENCY_PENALTY", 0)),
    presence_penalty = as.numeric(Sys.getenv("OPENAI_PRESENCE_PENALTY", 0))
  )
  if (as.logical(Sys.getenv("OPENAI_VERBOSE", TRUE))) {
    cat(paste0("\n*** ChatGPT input:\n\n", prompt, "\n"))
  }
  if (grepl("gpt-3.5-turbo", model)) {
    return_language <- Sys.getenv("OPENAI_RETURN_LANGUAGE")
    if (nchar(return_language) > 0) {
      return_language <- paste0("You return all your replies in ", return_language, ".")
    }
    messages <- list(
      list(
        role = "system",
        content = paste(
          "You are an excellent statistician, and you are a helpful assistant with extensive knowledge of R programming.",
          return_language
        )
      ),
      list(role = "user", content = prompt)
    )
    post_res <- httr::POST(
      "https://api.openai.com/v1/chat/completions",
      httr::add_headers("Authorization" = paste("Bearer", openai_api_key)),
      httr::content_type_json(),
      body = jsonlite::toJSON(c(params, list(messages = messages)), auto_unbox = TRUE)
    )
  } else {
    post_res <- httr::POST(
      "https://api.openai.com/v1/completions",
      httr::add_headers("Authorization" = paste("Bearer", openai_api_key)),
      httr::content_type_json(),
      body = jsonlite::toJSON(c(params, list(prompt = prompt)), auto_unbox = TRUE)
    )
  }
  if (!post_res$status_code %in% 200:299) {
    stop(httr::content(post_res))
  }
  httr::content(post_res)
}

