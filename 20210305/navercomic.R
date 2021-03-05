library(rvest)

navercomic <- data.frame()
for(i in 1:20) {
  url <- url <- "https://comic.naver.com/genre/bestChallenge.nhn?page="
  url <- paste0(url, i)
  text <- read_html(url)
  comicName <- html_nodes(text, xpath = '//*[@id="content"]/div/table/tr/td/div[2]/h6/a')
  comicName <- html_text(comicName, trim=T)
  comicSummary <- html_nodes(text, xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[1]')
  comicSummary <- html_text(comicSummary)
  comicGrade <- html_nodes(text, xpath = '//*[@id="content"]/div/table/tr/td/div[2]/div[2]/strong')
  comicGrade <- html_text(comicGrade, trim=T)
  page <- data.frame(comicName, comicSummary, comicGrade)
  navercomic <- rbind(navercomic, page)
}
write.csv(navercomic, "output/navercomic.csv")