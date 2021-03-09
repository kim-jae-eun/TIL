library(RSelenium)

remDr <- remoteDriver(remoteServerAddr = "localhost" , port = 4445, browserName = "chrome")
remDr$open()

url<-'http://gs25.gsretail.com/gscvs/ko/products/event-goods'
remDr$navigate(url)

two_to_one <- remDr$findElements(using = "css selector", "#TWO_TO_ONE")
sapply(two_to_one, function(x) {x$clickElement()})
Sys.sleep(1)

products <- NULL; curr_PageOldNum <- 0;
repeat {
  for (i in 1:8) {
    goodsname <- remDr$findElements(using = "css selector", paste0("div:nth-child(5) > ul > li:nth-child(", i, ") > div > p.tit"))
    goodsname <- unlist(sapply(goodsname, function (x) {x$getElementText()}))
    goodsprice <- remDr$findElements(using = "css selector", paste0("div:nth-child(5) > ul > li:nth-child(", i, ") > div > p.price"))
    goodsprice <- unlist(sapply(goodsprice, function (x) {x$getElementText()}))
    product <- data.frame(goodsname, goodsprice)
    products <- rbind(products, product)
  }
  Sys.sleep(1)
  
  nextpage <- remDr$findElements(using='css selector',"div:nth-child(5) > div > a.next")
  sapply(nextpage, function(x){x$clickElement()})
  Sys.sleep(1)
  
  curr_PageElem <- remDr$findElement(using='css','div:nth-child(5) > div > span > a.on')
  curr_PageNewNum <- as.numeric(curr_PageElem$getElementText())

  if(curr_PageNewNum == curr_PageOldNum)  {
    break; 
  }
  
  curr_PageOldNum <- curr_PageNewNum
}

write.csv(products, "output/gs25_twotoone.csv")