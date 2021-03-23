library(rvest)
library(XML)
library(httr)


for (i in 1:31) {
  i <- sprintf("%02d", i)
  j <- 1; titles <- NULL; title <- c(1);
  repeat {
    url <- paste0("https://news.daum.net/breakingnews/economic?page=",j,"&regDate=202005",i)
    text <- read_html(url)
    node1 <- html_nodes(text, "div.box_etc a.link_txt")
    node2 <- html_nodes(text, "div.box_etc span.info_news")
    new_title <- html_text(node1, trim=TRUE)
    if (new_title[1]==title[1]) {break} else {title <- new_title}
    company <- html_text(node2, trim=TRUE)
    company <- unlist(strsplit(company, " · "))
    company <- company[seq(1,length(company),2)]
    data <- data.frame(title, company)
    titles <- rbind(titles, data)
    j <- j+1
    Sys.sleep(1)
  }
  write.csv(titles, paste0("output/Rproject/newstitles/05", i, ".csv"))
  Sys.sleep(1)
}
