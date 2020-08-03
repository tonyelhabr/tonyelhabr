library(tweetrmd)
library(rtweet)

lasttweet_token <- function() {
  create_token(
    'rtweet_token',
    consumer_key = Sys.getenv('CONSUMER_KEY'),
    consumer_secret = Sys.getenv('CONSUMER_SECRET'),
    access_token = Sys.getenv('ACCESS_TOKEN'),
    access_secret = Sys.getenv('ACCESS_SECRET'),
    set_renv = FALSE
  )
}

handle <- 'TonyElHabr'
tweets_recent <- get_timeline(handle, n = 1000, token = lasttweet_token())
tweets_recent_rstats_idx <- grepl('#rstats', tweets_recent$text)
tweets_recent_rstats <- tweets_recent[tweets_recent_rstats_idx, ][1, ]

tmp <- 'tweet.png'
tweet_screenshot(
  tweet_url(handle, tweets_recent_rstats$status_id),
  scale = 5, 
  maxwidth = 600,
  theme = 'dark',
  file = tmp
)
