## 프로그램을 구성하는 요소들

1. 리터럴 : 프로그램에서 다루는 데이터 값

   ````
   10, 3.14, 'num', "num", '김', True, False, 123, '123', '@#', ...
   ````

   

2. 변수 : 값을 저장하려는 메모리 영역에 부여한 이름

   ``` 
   (1+2+3+4+5+6+7+8+9+10) / 10
   (1+2+3+4+5+6+7+8+9+10) * 10
   (1+2+3+4+5+6+7+8+9+10) - 10
   ```

   와 같은 명령어는 긴 연산을 반복하게 만든다. 이때 변수를 추가하여

   `result = 1+2+3+4+5+6+7+8+9+10` 라고 한다면

   ```
   result / 10
   result * 10
   result - 10
   ```

   로 간단하게 할 수 있다.

   - 변수는 만들어서 사용한다.
   - 변수명 규칙
                    - 키워드는 변수명이 될 수 없다. 
                    - 숫자로 시작할 수 없다.
       - 특수문자는 _(언더스코어)만 사용 가능하다.
                   - 공백사용 불가하다.
   - 대소문자 구분(NUM, num, Num)
                - 변수명 = 식(리터럴, 변수, 연산식, 함수의호출식)
                    l-value = r-value
                    (방, 메모리공간)    값
                    - 변수의 사용 : 방(l-value), 값(r-value)

   - 변수를 사용한 예제

     ```
     v1 = 10
     v2 = 20
     v3 = v1 + v2
     v4 = v1
     v4 = v1 + 100
     v4 = v5   --> 구문 오류 발생
     v5 = len([10,20,30]) *len은 길이값(요소의 전체 개수)
     ```



3. 연산자와 연산식(식)

   - 연산자 : 값을 가지고 처리하려는 기능을 나타내는 기호
                       +, -, *, /, ==, !=, >, <, and, or, +=, -=, *=, =
   - 피연산자 : 연산의 대상이 되는 값(변수, 리터럴, 연산식  --> 식) 
   - 연산식 : 연산자와 피연산로 구성된 식을 연산식

   

4. 데이터타입 : 데이터 값의 종류

   - 숫자형
   - 문자열형 ` '' ` ` "" ` `str()`
   - 부울형(대수형)

   ```
   123 * 3 --> 369  *숫자형
   '123' * 3 --> '123123123' *문자열형 3회 반복
   '@' * 100
   10 + 20 --> 30
   '10' + "20" --> "1020" *문자열형
   '10' + 20 --> 오류
   '10' + str(20) --> '1020'  *str(): 문자열 취급하게 하는 함수
   ```



5. 주석 : 코드에 대한 설명, 일부 코드를 실행하지 않게 하려는 경우

   ```
   단일행 주석 - # xxxxxxxxx
   다중행 주석 - """ xxxxxxxxx
                   xxxxxxxxx
                   xxxxxxxxx """
   ```

   

6. 함수 

   - 프로그래밍에서의 함수(서브루틴)
   - 자주 사용되는 명령(코드)들을 담고있는 블럭(주머니)  --> 프로그램의 재사용성
   - 함수에 의해 처리되는 기능에 따라 데이터를 받을 수도 있고 수행 결과값을 리턴할 수 있다.
   - 수행 결과값이 없는 경우에는 None(없음)이라는 리터럴이 리턴된다.

   ```
    - 함수 만드는 방법 
            def 함수명() :
   코드블럭
    - 함수 사용하는 방법 - 호출
           함수명()
           함수명(값1, 값2)	
   ```

   