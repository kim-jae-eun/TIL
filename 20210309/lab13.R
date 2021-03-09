library(wordcloud2)
?windowsFonts
text <- readLines("output/yes24.txt", encoding = "UTF-8")
text <- unlist(extractNoun(text))
text <- gsub("[^가-힣]", "", text)
text <- Filter(function (x) {nchar(x)>=2 & nchar(x)<=4}, text)
text <- data.frame(sort(table(text), decreasing=T))
result <- wordcloud2(text, fontFamily = "휴먼옛체")
htmltools::save_html(result,"output/yes24.html")