library(dplyr)
library(rvest)
library(XML)
library(httr)
library(readxl)

for (i in 1:31) {
  i <- sprintf("%02d", i)
  j <- 1; titles <- NULL;
  repeat {
    url <- paste0("https://news.naver.com/main/list.nhn?mode=LS2D&sid2=258&sid1=101&mid=shm&date=202012",i,"&page=", j)
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




week <- data.frame(read.csv("data/1주일.csv"))
onemonth <- data.frame(read.csv("data/1개월.csv"))
threemonth <- data.frame(read.csv("data/3개월.csv"))
sixmonth <- data.frame(read.csv("data/6개월.csv"))
ninemonth <- data.frame(read.csv("data/9개월.csv"))
may <- data.frame(read.csv("data/5월-하루.csv"))
fdata <- read.csv("data/데이터.csv")
total_count <- read.csv("data/stock_count_total2.csv")

View(total_count)

total_count %>% group_by(Name) %>% summarise(n=sum(Freq), mean=mean(Freq), prop_mean=mean(proportion)) -> may_result


View(may_result)
View(fdata)
head(may_result)
merge( may_result, fdata, by='Name', all=TRUE)-> may_data
may_data %>% filter(n >= 5) -> may_data
View(may_data)

cor(reg1[,2:34], use='complete.obs')->cor1
View(cor1)
reg1[,2:34]-> cor_data
cor_data[,-4:-23]->cor_data
cor_data <- cor_data[complete.cases(cor_data),]
cor(cor_data, use='complete.obs')->cor_result
corrplot(cor_result, method="color",  tl.col='black', type="lower", tl.srt=45)
plot.new()

boxplot(ninemonth[,-1] ,
        col=heat.colors(5)[odr],
        ylim=c(-2,10), 
        ylab='수익률',
        xlab='날짜',
        main='6개월 초과수익률')
merge(may_data, ninemonth, by='Name', all=TRUE) -> reg1

View(reg1)
head(reg1)
str(reg1)

lm(X20210226 ~ n + prop_mean+ log(매출액_2019) + 매출액영업이익률_2019 + 총자본영업이익률_2019 + 부채비율_2019 + 영업이익증가율_2019 + 총자산증가율_2019 + 총자본회전율_2019, data=reg1)->reg1.lm
  

summary(reg1.lm)

  
merge(may_data, sixmonth, by='Name', all=TRUE) -> reg2

lm(X20201130 ~ n + prop_mean + log(매출액_2019)  + 매출액영업이익률_2019 + 총자본영업이익률_2019 + 부채비율_2019 + 영업이익증가율_2019 + 총자산증가율_2019 + 총자본회전율_2019, data=reg2)->reg2.lm

View(reg2.lm  )
summary(reg2.lm)



merge(may_data, threemonth, by='Name', all=TRUE) -> reg3

lm(X20200831 ~ n + prop_mean + log(매출액_2019)  + 매출액영업이익률_2019 + 총자본영업이익률_2019 + 부채비율_2019 + 영업이익증가율_2019 + 총자산증가율_2019 + 총자본회전율_2019, data=reg3)->reg3.lm

summary(reg3.lm)


merge(may_data, onemonth, by='Name', all=TRUE) -> reg4

lm(X20200630 ~ n + prop_mean + log(매출액_2019) +  매출액영업이익률_2019 + 총자본영업이익률_2019 + 부채비율_2019 + 영업이익증가율_2019 + 총자산증가율_2019 + 총자본회전율_2019, data=reg4)->reg4.lm

summary(reg4.lm)

old.par <- par()
plot(reg2.lm)
plot(reg3.lm)
reg2.lm
reg1.lm

library(car)
vif(reg1.lm)
vif(mtcars.lm) > 4
vif(mtcars.lm) > 10

merge(may, total_count,  by='Name', all=TRUE) -> daily
merge(daily, fdata, by='Name', all=TRUE) -> daily_check
daily_check %>% filter(Freq >= 5) -> daily_check


daily_check %>% mutate(rdate=paste("X",date, sep="")) -> daily_check
daily_check %>% mutate(rdate_one=paste('X', date+1, sep=""))-> daily_check
daily_check %>% filter(daily_check[,names(rdate_one)])

head(daily_check)
View(total_count)                      


daily_check%>% select(Name, rdate_one) -> d1
t(d1) -> t1
t1[2,]-> t2
as.character(t2)->t2
colnames(t1)<-t2


may %>% filter(Name==d1$Name, colnames(may)%in% t1) %>% mutate
total_count %>% select(filter(may, Name==Name), date)

t(t1)-> d2
View(daily_check)
head(daily_check)
merge(daily_check, t1, all=TRUE)->t3

View(d1)
head(t3)
con <- (colnames(daily_check) %in% t1)

daily_check[con]
daily_check %in% t2

str(daily_check)

subset(daily_check,daily_check %in% t2)->aaa
View(aaa)


scatterplotMatrix(cor_data[,-1], pch=10, col="royalblue", cex=1.2,
                  regLine=list(method=lm, lty=1, lwd=3, col="salmon"),
                  smooth=list(smoother=loessLine, spread=FALSE, 
                              lty.smooth=1, lwd.smooth=3, col.smooth="forestgreen"),
                 )
?scatterplotMatrix


library(leaps)
library(RColorBrewer)
mtcars.regsubsets <- regsubsets(x=X20201130 ~ n + prop_mean + log(매출액_2019)  + 매출액영업이익률_2019 + 총자본영업이익률_2019 + 부채비율_2019 + 영업이익증가율_2019 + 총자산증가율_2019 + 총자본회전율_2019, data=reg2)


plot(mtcars.regsubsets, scale="adjr2", col=brewer.pal(9, "Pastel1"),
     main="All Subsets Regression")

summary(mtcars.regsubsets)
                       



data1 <- read.csv("output/Rproject/5월-하루.csv", encoding="UTF-8")
data2 <- read.csv("output/Rproject/newstitles/LG전자_count_total.csv")
data1 <- data1[c(-1, -2)] #첫 두 열 삭제
data1 <- data1 %>% filter(Name=="LG전자")  # 이름이 LG전자 인 행을 추출
data1 <- data1[,-1]  # 이제 LG 전자에 대해서만 다룰 걸 아니까 이름은 삭제 (수치데이터만 남김)
names(data1) <- gsub("X","",names(data1)) # 날짜에 X202005504 처럼 뜨길래 X 삭제
data1 <- data.frame(names(data1), as.numeric(data1)) # 날짜, 수익률 두 변수를 가지고 데이터프레임 만듦(transpose한 것과 비슷한 결과)
colnames(data1) <- c("date","price") # 새로 변수명 지정
data1 <- na.omit(data1)
data <- merge(data1, data2, by="date")