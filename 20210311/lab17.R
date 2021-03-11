library(dplyr)
library(ggplot2)

# 1-1
str(mpg)

# 1-2
dim(mpg)

# 1-3
mpg %>% head(10)

# 1-4
mpg %>% tail(10)

# 1-5
View(mpg)

# 1-6
summary(mpg)

# 1-7
mpg %>% count(manufacturer)

# 1-8
mpg %>% group_by(manufacturer, model) %>% count()





# 2-1
mpg2 <- mpg %>% rename(city=cty, highway=hwy)

# 2-2
head(data.frame(mpg2))





# 3-1
mw <- data.frame(midwest)
str(mw)

# 3-2
mw <- mw %>% rename(total=poptotal, asian=popasian)

# 3-3
mw <- mw %>% mutate("전체 인구 대비 아시아 인구 백분율" = asian/total)

# 3-4
mw <- mw %>% mutate("아시아 인구 비중"= ifelse(asian/total > mean(asian/total), "large", "small"))
head(mw)





# 4-1
mpg %>% group_by(displ<=4, displ>=5) %>% summarise(mean_hwy=mean(hwy))
# 배기량이 4 이하인 자동차의 고속도로 연비가 배기량이 5 이상인 자동차의 고속도로 연비보다 평균적으로 더 높다.

# 4-2
mpg %>% 
  filter(manufacturer=="audi" | manufacturer=="toyota") %>% 
  group_by(manufacturer) %>%
  summarise(mean_cty = mean(cty))
# toyota사의 도시 연비가 audi사의 도시 연비보다 평균적으로 더 높다.

# 4-3
mpg %>% 
  filter(manufacturer=="chevrolet" | manufacturer=="ford" | manufacturer=="honda") %>% 
  summarise(mean_hwy = mean(hwy))
# chevrolet, ford, honda의 고속도로 연비 평균은 22.5 이다.





# 5-1
mpg3 <- mpg %>% select(class, cty)
head(mpg3)

# 5-2
mpg3 %>%
  filter(class=="suv" | class=="compact") %>%
  group_by(class) %>%
  summarise(mean_cty=mean(cty))
# compact 자동차의 도시 연비가 suv 자동차의 도시 연비보다 평균적으로 더 높다.





# 6
mpg %>%
  filter(manufacturer=="audi") %>%
  arrange(desc(hwy)) %>%
  head(5)
