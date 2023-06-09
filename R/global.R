#' @title Set TidyChat Global Variables
#' @description Set TidyChat Global Variables
#' @param openai_api_key OpenAI API Key
#' @param proxy_url Proxy URL
#' @param proxy_port Proxy Port
#' @param openai_model OpenAI Model
#' @param openai_max_tokens OpenAI Max Tokens
#' @param openai_temperature OpenAI Temperature
#' @param openai_top_p OpenAI Top P
#' @param openai_frequency_penalty OpenAI Frequency Penalty
#' @param openai_presence_penalty OpenAI Presence Penalty
#' @param openai_verbose OpenAI Verbose
#' @param openai_return_language OpenAI Return Language
#' @return NULL
#'

#' @export
set_tidychat <- function(openai_api_key,
                         proxy_url = NULL,
                         proxy_port = NULL,
                         openai_model = "gpt-3.5-turbo",
                         openai_max_tokens = 256,
                         openai_temperature = 1,
                         openai_top_p = 1,
                         openai_frequency_penalty = 0,
                         openai_presence_penalty = 0,
                         openai_verbose = TRUE,
                         openai_return_language = "English"
                         ) {
    Sys.setenv(OPENAI_API_KEY = openai_api_key)
    Sys.setenv(OPENAI_MODEL = openai_model)
    Sys.setenv(OPENAI_MAX_TOKENS = openai_max_tokens)
    Sys.setenv(OPENAI_TEMPERATURE = openai_temperature)
    Sys.setenv(OPENAI_TOP_P = openai_top_p)
    Sys.setenv(OPENAI_FREQUENCY_PENALTY = openai_frequency_penalty)
    Sys.setenv(OPENAI_PRESENCE_PENALTY = openai_presence_penalty)
    Sys.setenv(OPENAI_VERBOSE = openai_verbose)
    Sys.setenv(OPENAI_RETURN_LANGUAGE = openai_return_language)
    if (!is.null(proxy_url)) {
        httr::set_config(httr::use_proxy(url = proxy_url, port = proxy_port))
    }
}

#' @title Get TidyChat Global Variables
#' @description Get TidyChat Global Variables
#' @return A list of TidyChat Global Variables
#' @export
#'
get_tidychat <- function(){
    list(
        openai_api_key = Sys.getenv("OPENAI_API_KEY"),
        openai_model = Sys.getenv("OPENAI_MODEL"),
        openai_max_tokens = Sys.getenv("OPENAI_MAX_TOKENS"),
        openai_temperature = Sys.getenv("OPENAI_TEMPERATURE"),
        openai_top_p = Sys.getenv("OPENAI_TOP_P"),
        openai_frequency_penalty = Sys.getenv("OPENAI_FREQUENCY_PENALTY"),
        openai_presence_penalty = Sys.getenv("OPENAI_PRESENCE_PENALTY"),
        openai_verbose = Sys.getenv("OPENAI_VERBOSE"),
        openai_return_language = Sys.getenv("OPENAI_RETURN_LANGUAGE")
    )
}

