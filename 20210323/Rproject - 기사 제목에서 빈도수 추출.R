library(dplyr)


stock_dic <- readLines("data/stockdic.txt", encoding="UTF-8")


for (n in 1:31) {
  n <- sprintf("%02d", n)
  text1 <- read.csv(paste0("output/Rproject/newstitles/05", n, ".csv"))
  stock_count <- NULL;
  for (i in stock_dic) {
    d <- NULL;
    if (length(grep(i, text1$title))>=5) {
      word <- i
      newsnumber <- grep(i, text1$title)
      for (j in newsnumber) {
        company <- text1 %>% filter(X==j) %>% select(company)
        t <- company[1,1]
        d <- c(d, t)
      }
      newscompany <- d
      data <- data.frame(word, newsnumber, newscompany)
      stock_count <- rbind(stock_count, data)
    }
  }
  write.csv(stock_count, paste0("output/Rproject/newstitles/stock_count05", n, ".csv"))
}



stock_count_total <- NULL;
for (n in 1:31) {
  n <- sprintf("%02d", n)
  text <- read.csv(paste0("output/Rproject/newstitles/stock_count05", n, ".csv"))
  date <- paste0("05-",n)
  text <- text$word
  data <- data.frame(table(text))
  a <- length(text)
  data <- data %>% mutate(proportion = round(Freq/a, 3) )
  data <- cbind(data, date)
  stock_count_total <- rbind(stock_count_total, data)
}
write.csv(stock_count_total, paste0("output/Rproject/newstitles/stock_count_total.csv"))
