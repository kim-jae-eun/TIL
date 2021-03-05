# 필요시 요청
remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

# url 주소 (네이버 호텔 - 신라스테이 역삼)
url<-'https://hotel.naver.com/hotels/item?hotelId=hotel:Shilla_Stay_Yeoksam&destination_kor=%EC%8B%A0%EB%9D%BC%EC%8A%A4%ED%85%8C%EC%9D%B4%20%EC%97%AD%EC%82%BC&rooms=2'
remDr$navigate(url)


replies <- NULL
repeat {
  
  # 댓글 찾기
  doms <- remDr$findElements(using = "css selector", "p.txt.ng-binding")
  reply <- sapply(doms, function (x) {x$getElementText()})
  replies <- c(replies, unlist(reply))
  Sys.sleep(1)
  
  # 다음 페이지 돔객체 찾기
  nextpage <- remDr$findElements(using='css selector',"div.review_ta.ng-scope > div.paginate > a.direction.next")
  
  # 마지막 페이지면 멈춤
  if (sapply(nextpage, function(x) {x$getElementAttribute("class")}) == "direction next disabled")
    break;
  
  # 아니면 다음 페이지로 이동
  sapply(nextpage, function(x){x$clickElement()})
  Sys.sleep(1)
  
}

write(replies,"output/naverhotel.txt")


