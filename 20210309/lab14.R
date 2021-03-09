library(tm)
library(proxy)

fruits <- NULL
듀크 <- c("사과 포도 망고")
둘리 <- c("포도 자몽 자두")
또치 <- c("복숭아 사과 포도")
도우너 <- c("오렌지 바나나 복숭아")
길동 <- c("포도 바나나 망고")
희동 <- c("포도 귤 오렌지")
fruits <- c(듀크, 둘리, 또치, 도우너, 길동, 희동)

cps <- VCorpus(VectorSource(fruits))
dtm <- DocumentTermMatrix(cps, control=list(wordLengths = c(1, Inf)))
as.matrix(dtm)
inspect(dtm)
m <- as.matrix(dtm)


# (1) 좋아하는 과일이 가장 유사한 친구들을 찾아본다.
com <- m %*% t(m)
dist(com, method = "cosine")
# 듀크와 또치, 듀크와 길동이 동등하게 유사하다.



# (2) 학생들에게 가장 많이 선택된 과일을 찾아본다.
sort(colSums(m), decreasing=T)
# 포도가 5회로 가장 많이 선택되었다.



# (3) 학생들에게 가장 적게 선택된 과일을 찾아본다.
sort(colSums(m))
# 귤, 자두, 자몽이 각각 1회로 가장 적게 선택되었다.