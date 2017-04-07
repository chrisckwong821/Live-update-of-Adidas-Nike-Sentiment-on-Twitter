negative_words <- scan("~/Desktop/r/Twitter/Sentiment_Twitter/opinion-lexicon-English/negative-words.txt",what='character',comment.char=";")
positive_words <- scan("~/Desktop/r/Twitter/Sentiment_Twitter/opinion-lexicon-English/positive-words.txt",what='character',comment.char=";")
score.sentiment <- function(sentences,pos.words,neg.words,.progress='none'){
  scores <- laply(sentences, function(sentence,pos.words,neg.words){
    #word.list <- strsplit(tolower(gsub("[^A-Za-z ]", "", sentence)), " ")[[1]]
    sentence <- gsub("[[:punct:]]",'',sentence) #punctuation
    sentence <- gsub("[[:cntrl:]]",'',sentence) #any control character
    sentence <- gsub("[^[:alnum:]///' ]",'',sentence) #any what
    sentence <- gsub("\\d+",'',sentence) #any digit \d means digit, \\d+ any digits specified in character
    sentence <- tolower(sentence) #remove capital case
    word.list <- str_split(sentence, '\\s+') #strip whitespace?, whitespace as delimiter?
    words <- unlist(word.list) #break down the list
    pos.matches <- match(words, pos.words) #after matching, return the location in dictionary for any match
    neg.matches <- match(words, neg.words) #for non-match, return NA
    pos.matches <- !is.na(pos.matches) #strip the list of location of NA
    neg.matches <- !is.na(neg.matches) #if NA is not stripped, sum would return 
    score <- sum(pos.matches) - sum(neg.matches)
    return (score)
  },neg.words,pos.words,.progress=.progress)
  scores.df <- data.frame(score=scores,text=sentences)
  return(scores.df)
}
