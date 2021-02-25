# 문제 1
exam1 <- function() {
  return(paste0(LETTERS,letters))
} ;print(exam1())

# 문제 2
exam2 <- function(x) {
  return(sum(1:x))
} ;print(exam2(10))

# 문제 3
exam3 <- function(x,y) {
  if (x>=y) {return(x-y)} else {return(y-x)} #return(abs(x-y))
} ;print(exam3(3,5))

# 문제 4
exam4 <- function(x,y,z) {
if (z=="+") {return(x+y)
} else if (z=="-") {return(x-y)
} else if (z=="*") {return(x*y)
} else if (z=="%/%") {if (x==0){return("오류1")} else if(y==0){return("오류2")} else{return(x%/%y)}
} else if (z=="%%") {if (x==0){return("오류1")} else if(y==0){return("오류2")} else{return(x%%y)}
} else {return("규격의 연산자만 전달하세요")}
} ;print(exam4(3,4,"*")) ;print(exam4(4,5,"/")) ;print(exam4(4,0,"%%"))

# 문제 5
exam5 <- function(x,y="#") {
  if(x>0){for(i in 1:x){cat(y)}}
}
exam5(7,"$")
exam5(5)
exam5(-4)

# 문제 6
exam6 <- function(x) {
  if (is.na(x)){print("NA는 처리불가")
  } else { if(x>=85){grade="상"}else if(x>=70){grade="중"}else{grade="하"}
    print(paste(x," 점은 ",grade,"등급입니다.",sep=""))
  }
} ;exam6(80) ;exam6(NA) ;exam6(35)

exam6 <- function(v) {
  for (x in v) {
    if (is.na(x)){print("NA는 처리불가")
    } else { if(x>=85){grade="상"}else if(x>=70){grade="중"}else{grade="하"}
      print(paste(x," 점은 ",grade,"등급입니다.",sep=""))
    }
  }
} ;exam6(c(80, 50, 70, 66, NA, 35))

#exam6 <- function(...) {
#  for (x in c(...)) {
#    if (is.na(x)){print("NA는 처리불가")
#    } else { if(x>=85){grade="상"}else if(x>=70){grade="중"}else{grade="하"}
#      print(paste(x," 점은 ",grade,"등급입니다.",sep=""))
#    }
#  }
#} ;exam6(80, 50, 70, 66, NA, 35)