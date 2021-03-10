library(showtext)
showtext_auto()
font_add(family = "dog", regular = "fonts/THEdog.ttf")
font_add(family = "maple", regular = "fonts/MaplestoryBold.ttf")



# 문제 1
data <- read.table("data/product_click.log", col.names=c("Clicktime", "PID"))
barplot(table(data[[2]]),
        main='세로바 그래프 실습',
        col=terrain.colors(10),
        col.main="red",
        xlab='상품 ID', ylab='클릭 수',
        family="dog")


dev.copy(png, "output/clicklog1.png", width=700) 
dev.off()



# 문제 2
data2 <- table(substr(data[[1]],9,10))
pie(data2,
    main = "파이그래프 실습",
    labels = paste0(as.numeric(names(data2)), "~", as.numeric(names(data2))+1),
    col = rainbow(17),
    col.main="blue",
    radius=1,
    family="maple")


dev.copy(png, "output/clicklog2.png", width=600) 
dev.off()



# 문제 3
성적 <- read.table("data/성적.txt", header=TRUE)
성적2 <- 성적[3:5]
boxplot(성적2, axes=F,
          col=rainbow(3))
title(main="과목별 성적 분포", col.main="orange", family="maple", font.main=4)
axis(1, at=1:3, lab=names(성적2), family="maple")
axis(2, at=seq(2,10,2), family="maple")
box()


dev.copy(png, "output/clicklog3.png", width=600) 
dev.off()



# 문제 4
barplot(t(성적2),
        main="학생별 점수",
        col=c("orange","lightblue","pink"),
        col.main="violet",
        space=0.2,
        cex.axis=0.8,
        names.arg=성적[[2]],
        cex=0.8,
        family="dog")
legend(10.5, 29, names(성적2), cex=1,
       fill=c("orange","light blue","light pink"))


dev.copy(png, "output/clicklog4.png", width=600) 
dev.off()
