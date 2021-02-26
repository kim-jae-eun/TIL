# 문제 8
test1 <- scan("data/iotest1.txt") ;test1
cat("오름차순 :",sort(test1),"\n내림차순 :",sort(test1,decreasing=T)
    ,"\n합 :",sum(test1),"\n평균 :",mean(test1))