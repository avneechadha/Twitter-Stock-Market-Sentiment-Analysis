library("twitteR")
library("ROAuth")
library("bitops")
library("RCurl")
library("rjson")


# register for twitter Developer side to obtain API key



####

#3 gainers of the day(dated: May1, source: https://finance.search.yahoo.com)
tweets1 <- searchTwitter('$NYSE',n=85)
tweets1

tweets2 <- searchTwitter('$BOSC',n=70)
tweets2

tweets3 <-  searchTwitter('$ENOC',n=100)
tweets3

tweetgainer <- c(tweets1, tweets2, tweets3)



#3 losers of the day(dated: May1, source: https://finance.search.yahoo.com, http://www.google.com/finance)
tweetsN1 <-searchTwitter('$NYSE', n = 86)
tweetsN1


tweetsN2 <-searchTwitter('$Yelp', n = 100)
tweetsN2

tweetsN3 <-searchTwitter('$Nasdaq', n = 100)
tweetsN3


tweetloser<-c(tweetsN1,tweetsN2,tweetsN3)
tweetloser


#Merging tweets into one set containing 300 tweets
tweets <-merge(tweetgainer, tweetloser, all=T, n=300)
tweets


display.tweet <- function (tweets) 
  {
    cat("Screen name:", tweets$getScreenName(), "\nText:", tweets$getText(), "\n\n")
  }

for (t in tweetsN3)
  {
    display.tweet(t)
  }




#####

#Creating Corpus
getCorpus <-function(tweets)
  {
    tweets.text <- lapply(tweets, function(t) {t$getText()})
    data.source <- VectorSource(tweets.text)
    data.corpus <- Corpus(data.source)
    return(data.corpus)
  }

data.corpus1<- getCorpus( tweetgainer)
inspect(data.corpus1[1:2])

data.corpus2<- getCorpus(tweetloser)
inspect(data.corpus2[1:2])

#Saving Corpora
writeCorpus(data.corpus1)
writeCorpus(data.corpus2)

data.corpus1[[1]]
data.corpus2[[2]]




#####

#Preprocessing Corpus
removeNumberWords <- function(x)
  {
    gsub("([[:digit:]]+)([[:alnum:]])*", "", x)
  }

removeURL <- function(x) 
  {
    gsub("(http[^ ]*)", "", x)
  }

getTransCorpus1 <- function (data.corpus1)
  {
    data.corpus1 <- tm_map(data.corpus1, content_transformer(tolower)) 
    data.corpus1 <- tm_map(data.corpus1, content_transformer(removeURL)) 
    data.corpus1 <- tm_map(data.corpus1, content_transformer(removePunctuation))
    english.stopwords <- stopwords("en")
    data.corpus1 <-tm_map(data.corpus1,content_transformer(removeWords),english.stopwords) 
    data.corpus1 <- tm_map(data.corpus1, content_transformer(removeNumberWords)) 
    data.corpus1 <- tm_map(data.corpus1,content_transformer(stemDocument)) 
    data.corpus1 <- tm_map(data.corpus1,content_transformer(stripWhitespace)) 
    return (data.corpus1)
  }

data.corpus1 <- getTransCorpus1(data.corpus1)

inspect(data.corpus1[1:2])

data.corpus2 <- getTransCorpus1(data.corpus2)

inspect(data.corpus2[1:2])



#####

#Creating the term document matrix
tdm1 <- TermDocumentMatrix(data.corpus1)

tdm2 <- TermDocumentMatrix(data.corpus2)


#Inspecting portion of the matrix
inspect(tdm1[150:160, 50:60])

inspect(tdm2[150:160, 50:60])

tdm1[150:160, 50:60]

save(list=("tdm1"), file = "corpora1.RData")

load(file="corpora1.RData")

save(list=("tdm2"), file = "corpora2.RData")

load(file="corpora2.RData")





#####

#Converting TDM to a matrix
m1 <- as.matrix(tdm1)

m2 <- as.matrix(tdm2)

#View portion of the matrix
m1[150:160, 51:60]
m2[150:160, 51:60]


#Calculate the frequency of words 
wordFreq1 <- rowSums(m1)
wordFreq2 <- rowSums(m2)


#Sort the words by descending order of frequency
wordFreq1 <- sort(wordFreq1, decreasing=TRUE)
wordFreq2 <- sort(wordFreq2, decreasing=TRUE)


#Frequent terms sets
findFreqTerms(tdm1, lowfreq=15)
findFreqTerms(tdm2, lowfreq=15)


#Word cloud
library(wordcloud)

palette <- brewer.pal(8,"Dark2")
palette

set.seed(137)
wordcloud(words=names(wordFreq1), 
          freq=wordFreq1, 
          min.freq=10, 
          random.order=F,
          colors=palette)

wordcloud(words=names(wordFreq2), 
          freq=wordFreq2, 
          min.freq=15, 
          random.order=F,
          colors=palette)




#####

#Lexicons
pos.words = scan('positive-words.txt', what='character', comment.char=';')

neg.words = scan('negative-words.txt', what='character', comment.char=';')

head(pos.words)

head(neg.words)

gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
sentiment <- function(text, pos.words, neg.words)
  {
    text <- gsub('[[:punct:]]', '', text)
    text <- gsub('[[:cntrl:]]', '', text)
    text <- gsub('\\d+', '', text) # \\d represents digit
    text <- tolower(text)
    
    #Split the text into a vector of words
    words <- strsplit(text, '\\s+')
    words <- unlist(words)
    
    #Find which words are positive
    pos.matches <- match(words, pos.words)
    pos.matches <- !is.na(pos.matches)
    
    #Find which words are negative
    neg.matches <- match(words, neg.words)
    neg.matches <- !is.na(neg.matches)
    
    #Calculate the sentiment score
    score <- sum(pos.matches) - sum(neg.matches)
    cat (" Positive: ", words[pos.matches], "\n")
    cat (" Negative: ", words[neg.matches], "\n")
    return (score)
  }

save(list="tweetgainer",
     file="tweetgainer.RData")

save(list="tweetloser",
     file="tweetloser.RData")

load(file="tweetgainer.RData")
load(file="tweetloser.RData")

iconv(x, from = "", to = "", sub = NA, mark = TRUE, toRaw = FALSE)
tweetgainer.texts <- lapply(tweetgainer, function(t) {
                              iconv(t$getText(), "latin1", "ASCII", sub="")})


tweetloser.texts <- lapply(tweetloser, 
                           function(t) {
                             iconv(t$getText(), "latin1", "ASCII", sub="")})



#Send R Output to a temporaray File by Sink()
sink(tempfile())

#Sapply works on a list or vector of data
scores1 <- sapply(tweetgainer.texts, sentiment, pos.words, neg.words)


scores2 <- sapply(tweetloser.texts, sentiment, pos.words, neg.words)


sink()



table(scores1)

barplot(table(scores1), 
        xlab="Scores", ylab="Count",
        col="cyan")



table(scores2)

barplot(table(scores2), 
        xlab="Score", ylab="Count",
        col="cyan")


#Again Sentimenting
sentiment.na <- function(text, pos.words, neg.words)
{
  text <- gsub('[[:punct:]]', '', text)
  text <- gsub('[[:cntrl:]]', '', text)
  text <- gsub('\\d+', '', text)
  text <- tolower(text)
  # split the text into a vector of words
  words <- strsplit(text, '\\s+')
  words <- unlist(words)
  # find which words are positive
  pos.matches <- match(words, pos.words)
  pos.matches <- !is.na(pos.matches)
  # find which words are negative
  neg.matches <- match(words, neg.words)
  neg.matches <- !is.na(neg.matches)
  # calculate the sentiment score
  p <- sum(pos.matches)
  n <- sum(neg.matches)
  if (p == 0 & n == 0)
    return (NA)
  else
    return (p - n)
}

scores1.na <- sapply(tweetgainer.texts, sentiment.na, pos.words, neg.words)

table(scores1.na)

barplot(table(scores1.na), xlab="Score", ylab="Count", ylim=c(0,40), col="cyan")


scores2.na <- sapply(tweetloser.texts, sentiment.na, pos.words, neg.words)

table(scores2.na)

barplot(table(scores2.na), xlab="Score", ylab="Count", ylim=c(0,40), col="cyan")




###### Stock Market Analysis Project

library(quantmod)
library(plyr)

#Extracting data from yahoo/financial site
getSymbols.yahoo(c('MSFT','GOOG','AAPL','GSPC'),env=globalenv(), from = "2015-01-01",to = Sys.Date(), index="Date")


#Merging data in one file
stocks2015<-merge(MSFT,GOOG,AAPL,GSPC)             
stocks2015 

#Adding column name
Stocks <- as.matrix(stocks2015)
names(dimnames(Stocks)) <- c("Date", "")


#Creating table from the stock values mentioned in the Stocks matrix(dated: 30-04-15)
#Designing dataframe
Stocks.data = data.frame(
  Company = c("MSFT","GOOG","AAPL","GSPC"),
  High = c(49.54, 548.590, 128.64, 21.5999),
  Adjusted=c(48.64000,537.340,125.1500, 21.4400),
  Volume=c(63652600,2066200,82475900,9800))

Stocks.data


#Bubble chart
chart1 <- gvisBubbleChart(Stocks.data, 
                          idvar="Company", 
                          xvar="Adjusted", yvar="High",
                          colorvar="Company", sizevar="Volume",
                          options=list(
                            hAxis='{minValue:80, maxValue:550}',
                            width=600, height=400))
plot(chart1)             


