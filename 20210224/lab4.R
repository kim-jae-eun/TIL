# 문제 1
L1 <- list("scott",3000)
names(L1) <- c("name","sal") ;L1
result1 <- L1[["sal"]]*2 ;result1

# 문제 2
L2 <- list("scott", c(100,200,300)) ;L2

# 문제 3
L3 <- list(c(3,5,7), c("A","B","C"))
L3[[2]][1] <- "Alpha" ;L3

# 문제 4
L4 <- list(alpha=0:4, beta=sqrt(1:5), gamma=log(1:5))
L4$alpha + 10

# 문제 5
emp <- read.csv('data/emp.csv')
L5 <- list(data1 = LETTERS, data2 = emp[1:3,], data3 = L4) ;L5
L5[[1]][1]
L5[[2]]$ename
L5[[3]]$gamma

# 문제 6
L6 <- list(math=list(95, 90), writing=list(90, 85), reading=list(85, 80))
mean(unlist(L6))

# 문제 7
grade <- sample(1:6,1)
if (grade<=3) {cat(grade,"학년은 저학년입니다.")
  }else {cat(grade,"학년은 고학년입니다.")}

# 문제 8
choice <- sample(1:5,1)
if(choice==1){result=300+5
}else if(choice==2){result=300-5
}else if(choice==3){result=300*50
}else if(choice==4){result=300/50
}else{result=300%%50}
cat("결과값 :",result)

# 문제 9
count <- sample(3:10,1)
deco <- sample(1:3,1)
if(deco==1){deco="*"
  }else if(deco==2){deco="$"
  }else{deco="#"}
for (i in 1:count){cat(deco)}

# 문제 10
score <- sample(0:100,1)
if(score>=90){type=1
}else if (score>=80){type=2
}else if (score>=70){type=3
}else if (score>=60){type=4
}else {type=5}
level <- switch(type,"A 등급","B 등급","C 등급","D 등급","F 등급")
cat(score," 점은 ",level,"입니다.",sep="")

# 문제 11
alpha <- paste(LETTERS, letters, sep="") ;alpha