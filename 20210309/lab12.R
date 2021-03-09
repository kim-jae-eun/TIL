# 문제 1
v1 <- c("Happy","Birthday","to","You")
sum(nchar(v1))


# 문제 2
library(stringr)
v1 <- c("Happy","Birthday","to","You")
v1<- paste(v1, collapse = " ")
length(v1)
str_length(v1)


# 문제 3
paste(LETTERS[1:10], 1:10)
paste0(LETTERS[1:10], 1:10)


# 문제 4
text <- "Good Morning"
text <- strsplit(text, split = " ")
list(text[[1]][1], text[[1]][2])


# 문제 5
text2 <- c("Yesterday is history, tommrrow is a mystery, today is a gift!", 
          "That's why we call it the present - from kung fu Panda")
text2 <- gsub("[,-]","",text2)
text2 <- gsub("\\s{2}"," ",text2) # 2개의 공백을 1개의 공백으로 바꿈
text2 <- unlist(strsplit(text2, split = " ")) ;text2


# 문제 6
s1 <- "@^^@Have a nice day!! 좋은 하루!! 오늘도 100점 하루...."
r1 <- gsub("[가-힣]", "", s1) ;r1
r2 <- gsub("[[:punct:]]", "", s1) ;r2
r3 <- gsub("[(가-힣)[:punct:]]", "", s1) ;r3
r4 <- gsub("100", "백", s1) ;r4


# 문제 7
library(KoNLP)
hotel <- readLines("data/hotel.txt")
hotel <- extractNoun(hotel)
hotel <- unlist(hotel)
hotel <- Filter(function(x){nchar(x)>=2}, hotel) ;hotel
hotel <- sort(table(hotel), decreasing=T)
df <- data.frame(hotel[1:10])
colnames(df) <- c("wname", "wcount")
write.csv(df, "output/hotel_top_word.csv")