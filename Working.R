library(ggplot2)
library(plyr)
library(stringr)
library(doBy)
library(streamR)
library(ROAuth)
source('Sentiment_Analysis.R')
###
AD.tweets.df <- parseTweets('Adadas.json')
AD.score <- score.sentiment(AD.tweets.df$text, positive_words, negative_words)
AD.score$name = 'Adidas'
AD.score$code = 'AD'
AD.score$retweet <- AD.tweets.df$retweet_count
#####
NI.tweets.df <- parseTweets("Nike.json")
NI.score <- score.sentiment(NI.tweets.df$text, positive_words, negative_words)
NI.score$name = 'Nike'
NI.score$code = 'NI'
NI.score$retweet <- NI.tweets.df$retweet_count
###
all.scores = rbind(select(AD.score,-text),select(NI.score,-text))
g = ggplot(data=all.scores, mapping=aes(x=score, fill=name))
g = g + geom_histogram(binwidth=1)
g = g + facet_grid(name~.)
g = g + theme_bw() #remove grey background
g
#####
library(dplyr)
all.scores$weightscore <- all.scores$score * all.scores$retweet
orderBy(~ -retweet,all.scores)
###some further analysis on extreme data
# all.scores$very.neg.bool <- all.scores$score < 0 
# all.scores$very.pos.bool <- all.scores$score > 2 
# twitter.df <- ddply(all.scores, c('name', 'code'), summarise, 
#                     very.pos.count=sum( very.pos.bool ), very.neg.count=sum( very.neg.bool ))
# 
