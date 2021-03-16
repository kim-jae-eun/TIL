library(psych)
library(corrgram)
library(corrplot)


?airquality
head(airquality)

# 결측치 행을 제거
air <- na.omit(airquality)
#View(air)


# Ozone, Solar.R, Wind, Temp 변수들을 가지고 상관계수 구하기
corr.test(air[1:4])
# Ozone 과 Solar.R, Ozone과 Wind, Ozone과 Temp, Solar.R과 Temp, Wind와 Temp 모두 통계적으로 유의한 상관관계를 가진다.
# 유의확률이 0.05를 초과하는 Solar.R 과 Wind 변수 간에는 통계적으로 유의한 상관관계가 없다.


# 시각화 1
png("output/lab201.png", width=600, height=400)
pairs.panels(air[1:4],
             bg="red",
             hist.col="gold",
             pch=21,
             main="Correlation Plot of airquality Data")
dev.off()



# 시각화 2
png("output/lab202.png", width=600, height=400)
pairs(air[1:4])
dev.off()


# 시각화 3
png("output/lab203.png", width=600, height=400)
corrplot(cor(air[1:4]),
         method="pie",
         type="lower",
         order="hclust",
         tl.srt=45,
         diag=F,
         addCoef.col="black")
dev.off()