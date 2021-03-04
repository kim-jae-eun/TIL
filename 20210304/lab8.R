# 방법 1
library(rvest)

url <- "https://news.daum.net/ranking/popular"
newstitle <- NULL; newspapername <- NULL; daumnews <- NULL;
for(i in 1:50) {
  text <- read_html(url)
  # 뉴스 제목
  newstitle <- html_nodes(text, xpath = paste('//*[@id="mArticle"]/div[2]/ul[3]/li[', i, ']/div[2]/strong/a'))
  newstitle <- html_text(newstitle) ;print(newstitle)
  # 신문사
  newspapername <- html_nodes(text, xpath = paste('//*[@id="mArticle"]/div[2]/ul[3]/li[', i, ']/div[2]/strong/span'))
  newspapername <- html_text(newspapername) ;print(newspapername)
  
  page <- data.frame(newstitle, newspapername)
  daumnews <- rbind(daumnews, page)
}
write.csv(daumnews, "output/daumnews.csv")



# 방법 2
library(XML)

newstitle <- NULL; newspapername <- NULL; daumnews <- NULL;
imsi <- read_html("https://news.daum.net/ranking/popular")
t <- htmlParse(imsi)
for(i in 1:50) {
  newstitle <- xpathSApply(t,paste('//*[@id="mArticle"]/div[2]/ul[3]/li[', i, ']/div[2]/strong/a'), xmlValue)
  newspapername <- xpathSApply(t,paste('//*[@id="mArticle"]/div[2]/ul[3]/li[', i, ']/div[2]/strong/span'), xmlValue)
  page <- data.frame(newstitle, newspapername)
  daumnews <- rbind(daumnews, page)
}
write.csv(daumnews, "output/daumnews2.csv")