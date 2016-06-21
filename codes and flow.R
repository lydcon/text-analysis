#TATABOX42/text-mining-in-r, il a fait ce ci mais j'l'ai pas utilise
library(reshape)
library(ggplot2)
library(NLP)
library(tm)
library(wordcloud)
#LOADING THE DATA, the strings as a fector should be false
brexitN

#combining the wordings together
together<- paste(brexitN, Collapse=" ")
together

#setting up as a vector and corpus, a corpus is the ---------------of the doc you want to compare
vec<-VectorSource(together)
vec
corpus<-Corpus(vec)
corpus


#cleaning the data from whitespace, punctuations and stop words eg betweenm after, they are commob words
tm is used for comparing diff data sets

#tm map is used for perfoming multiple functions

corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, stripWhitespace)
corpus <- tm_map(corpus, removeWords, stopwords("english"))

stopwords('english')


#Making a doc term matrix, where the sparce matrix is different from the usual matrix_
#because it doesnt have rows and columns
dtm<-DocumentTermMatrix(corpus)
dtm
dtmMat<-as.matrix(dtm)

#Finding the most frequent terms
FreqTerms<-colSums(dtmMat)
str(FreqTerms)
FreqTerms
FreqSort<- sort(FreqTerms, decreasing=T)#Sorting in descending order
str(FreqSort)
FreqSort

#we need to load the word cloud library here

library(wordcloud)#it needs(RColorBrewer)


words <-names(FreqSort)
words
head(words)

wordcloud(words[1:100], FreqSort[1:100])
wordcloud(words[1:20, FreqSort[1:20)
