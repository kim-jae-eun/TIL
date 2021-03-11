library(dplyr)

data <- read.csv("data/emp.csv")
head(emp)

#1
data %>% filter(job=="MANAGER")
#2
data %>% select(empno, ename, sal)
#3
data %>% select(-empno)
#4
data %>% select(ename, sal)
#5
data %>% count(job)
#6
data %>% filter(sal>=1000 & sal<=3000) %>% select(ename, job, sal)
#7
data %>% filter(job!="ANALYST") %>% select(ename, job, sal)
#8
data %>% filter(job=="ANALYST" | job=="SALESMAN") %>% select(ename, job)
#9
data %>% group_by(deptno) %>% summarise(sum(sal))
#10
data %>% arrange(sal)
#11
data %>% arrange(desc(sal)) %>% head(1)
#12
empnew <- data %>% rename(salary=sal, commrate=comm)
#13
data %>% count(deptno) %>% max
#14
data %>% select(ename) %>% mutate(enamelength=nchar(ename)) %>% arrange(enamelength)
#15
data %>% filter(!is.na(comm)) %>% count()