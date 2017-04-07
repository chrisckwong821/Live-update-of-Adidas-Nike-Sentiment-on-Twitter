library(streamR)
library(ROAuth)
requestURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- 'hxqGkAj9Ga2JZG54FX0dIodZi'
consumerSecret <- 'iuZ0xBsOE35g6ED5koLcx6EmUlXFXcIpxxAyTgIlc7xIcYhK02'
my_oauth <- OAuthFactory$new(consumerKey = consumerKey, consumerSecret = consumerSecret, 
                             requestURL = requestURL, accessURL = accessURL, authURL = authURL)
my_oauth$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
tweets.df <- parseTweets(file)
View(tweets.df)
save(my_oauth, file = "my_oauth2.Rdata")
#load("my_oauth2.Rdata")
