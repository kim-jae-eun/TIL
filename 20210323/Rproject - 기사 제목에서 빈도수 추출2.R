library(dplyr)


names <- readLines("output/Rproject/5회 이상 언급된 날짜 수가 월 12회 이상.txt", encoding="UTF-8")

for (name in names) {
  for (n in 1:31) {
    n <- sprintf("%02d", n)
    text1 <- read.csv(paste0("output/Rproject/newstitles/05", n, ".csv"))
    stock_count <- NULL;
    newsnumber <- grep(name, text1$title)
    d <- NULL;
    for (j in newsnumber) {
      company <- text1 %>% filter(X==j) %>% select(company)
      t <- company[1,1]
      d <- c(d, t)
    }
    newscompany <- d
    data <- data.frame(newsnumber, newscompany)
    stock_count <- rbind(stock_count, data)
    write.csv(stock_count, paste0("output/Rproject/newstitles/else/",name,"_count05", n, ".csv"))
  }
  
  
  
  stock_count_total <- NULL;
  for (n in 1:31) {
    n <- sprintf("%02d", n)
    text <- read.csv(paste0("output/Rproject/newstitles/else/",name,"_count05", n, ".csv"))
    date <- paste0("202005",n)
    count <- nrow(text)
    predict_date <- as.numeric(date) + 1
    data <- data.frame(count, date, predict_date)
    stock_count_total <- rbind(stock_count_total, data)
  }
  write.csv(stock_count_total, paste0("output/Rproject/newstitles/", name, "_count_total.csv"))
}




# 추가
for (name in names) {
  stock_count_total <- NULL;
  for (n in 1:31) {
    n <- sprintf("%02d", n)
    text <- read.csv(paste0("output/Rproject/newstitles/else/",name,"_count05", n, ".csv"))
    date <- paste0("202005",n)
    count <- nrow(text)
    predict_date <- as.numeric(date) + 1
    yesterday_date <- as.numeric(date) - 1
    data <- data.frame(count, date, predict_date, yesterday_date)
    stock_count_total <- rbind(stock_count_total, data)
  }
  write.csv(stock_count_total, paste0("output/Rproject/newstitles/", name, "_count_total.csv"))
}


