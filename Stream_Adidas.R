library(streamR)
load("my_oauth.Rdata")
file <- "Adadas.json" ;track <- "#adidas" ;follow <- NULL; loc <- NULL; lang <- NULL; 
time <- 0; tweets <- NULL; 
filterStream(file.name=file,track=track,follow = follow,locations=loc,language=lang,timeout=time,
             tweets=tweets,verbose = TRUE,oauth = my_oauth)
