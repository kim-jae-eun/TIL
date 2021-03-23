library(rvest)
library(XML)
library(httr)


for (i in 1:31) {
  i <- sprintf("%02d", i)
  j <- 1; titles <- NULL;
  repeat {
    url <- paste0("https://news.naver.com/main/list.nhn?mode=LS2D&sid2=258&sid1=101&mid=shm&date=202005",i,"&page=", j)
    text <- read_html(url)
    nodes <- html_nodes(text, "div.list_body.newsflash_body a")
    title <- html_text(nodes, trim=TRUE)
    title <- title[title!="" & title!="동영상기사"]
    new_titles <- unique(c(titles, title))
    if (length(titles)==length(new_titles)) {titles <- new_titles; break;} else {titles <- new_titles; j <- j+1;}
    Sys.sleep(1)
  }
  write(titles, paste0("output/Rproject/newstitles/05",i,".txt"))
  Sys.sleep(1)
}