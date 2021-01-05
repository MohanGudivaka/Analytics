tweets=readLines("tweets.txt")
tweets
head(tweets)
install.packages("tm")
library(tm)
vs<-VectorSource(tweets)
vs
myCorpus2<-VCorpus(vs)
myCorpus2
myCorpus2 <- tm_map(myCorpus2, content_transformer(tolower))
myCorpus2 <- tm_map(myCorpus2, removePunctuation)
myCorpus2 <- tm_map(myCorpus2, stripWhitespace)
myCorpus2 <- tm_map(myCorpus2, removeWords,stopwords(kind="en"))
removeURL <- content_transformer(function(x) gsub("(f|ht)tp(s?)://\\S+", "", x, perl=T))
myCorpus2 <- tm_map(myCorpus2, removeURL)
dtm <- TermDocumentMatrix(myCorpus2)
dtm
dtm <- TermDocumentMatrix(myCorpus2)
dtm
findFreqTerms(dtm, 5)
dtm<-removeSparseTerms(dtm,0.99)
dtm
clusters <- hclust(dist(dtm))
clusters
plot(clusters)
rect.hclust(clusters, k = 12, border = "blue")
