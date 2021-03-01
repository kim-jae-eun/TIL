# 문제 9
test2 <- scan("data/iotest2.txt", what="",encoding="UTF-8") ;test2
r <- names(which.max(table(test2)))
cat("가장 많이 등장한 단어는",r,"입니다.")

max(table(test2))
test2
table(test2)