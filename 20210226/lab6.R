# 문제 1
countEvenOdd <- function(x) {
  if(is.vector(x) && is.numeric(x)) {
    even=0;odd=0;
    for(data in x) {
      if(data%%2==0){even <- even+1} else{odd <- odd+1}
    }
    return(list(even,odd))
  }
}

countEvenOdd(1:9)



# 문제 2
vmSum <- function(x){
  result <- 0
  if(is.vector(x) && !is.list(x)) {
    if(is.numeric(x)) {
      result <- sum(x)
    } else {cat("숫자 벡터를 전달하숑!")}
  } else {
    result="벡터만 전달하숑!"
  }
  return(result)
}

vmSum(1:10)
vmSum(list(1,2,3))
vmSum(LETTERS)
vmSum(matrix())



# 문제 3
vmSum2 <- function(x){
  result <- 0
  if(is.vector(x) && !is.list(x)) {
    if(is.numeric(x)) {
      result <- sum(x)
    } else {warning("숫자 벡터를 전달하숑!")}
    return(result)
  } else {
    stop("벡터만 전달하숑!")
  }
}

vmSum2(1:10)
vmSum2(LETTERS)
vmSum2(matrix())



# 문제 4
mySum <- function(x){
  oddSum<-0;evenSum<-0;
  if(!is.vector(x)){stop("벡터만 처리 가능!!")}
  else if(!is.null(x)){
    for(data in x) {
      if(is.na(data)){
        data <- min(x, na.rm=T)
        warning("NA를 최저값으로 변경하여 처리함!!")
      }
      if(data%%2==0){evenSum <- evenSum+data} else{oddSum <- oddSum+data}
    }
    return(list(oddSum,evenSum))
  }
}

mySum(1:10)
mySum(c(1,2,3,4,5,NA))



# 문제 5
myExpr <- function(x){
  if(!is.function(x)){stop("수행 안할꺼임!!")}
  else{
    data <- sample(1:45,6)
    return(x(data))
  }
}

myExpr(1)
myExpr(mySum)



# 문제 6
createVector1 <- function(...){
  x <- c(...)
  if(!is.null(x) && !any(is.na(x))) {
    return(x)
  } else if(any(is.na(x))) {return(NA)}
}

createVector1("안녕",1,"멀티캠퍼스",2,4,TRUE,FALSE)
createVector1("안녕",1,"멀티캠퍼스",2,4,TRUE,FALSE,NA)
print(createVector1())



# 문제 7
createVector2 <- function(...){
  num=c();char=c();log=c();v<-list(...)
  if(!is.null(c(...))){  #!is.null(v) 안 됨
    for(data in v){
      if(is.numeric(data)) num <- c(num,data)
      else if(is.character(data)) char <- c(char,data)
      else if(is.logical(data)) log <- c(log,data)
    }
    return(list(num,char,log))
  }
}

createVector2("안녕",1,"멀티캠퍼스",2,4,TRUE,FALSE)
print(createVector2())