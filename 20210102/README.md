### TIL: branch 충돌 해결 방법
> 서로 다른 branch에서 수정한 내용을 `merge`할 때 충돌이 일어날 수 있다. 그에 대한 대응책을 알아본다.
- 유용한 명령어

    ```
    git log --branches --graph --decorate
    ```
    이 명령어를 사용하면 현재 HEAD가 가리키는 브랜치와 관계 없이 전체 로그를 볼 수 있으며, 좌측에 그래프 구조가 간단하게 표현된다. q를 누르면 빠져나온다.
    ```
    git commit -m "메세지"
    git commit -a
    git commit -am "메세지"
    ```
    첫 번째는 커밋 이름 저장, 두 번째는 add 와 commit을 동시에, 세 번째는 add 와 commit 뿐 아니라 이름 저장까지 같이 할 수 있다. 이 때, 한 번이라도 add되지 않은 파일은 커밋되지 않는다.
- `git merge` 의 오류 내용
    ```
    git branch test
    touch a.txt
    git add a.txt
    git commit -m 'add a.txt'
    git checkout test
    touch b.txt
    git commit -m 'add b.txt'
    git checkout master
    git merge test
    ```
    를 입력했을 때 오류가 발생하며, 무시하고 나가면 자동으로 합쳐진다. 파일이 다르기 때문에 일어난 경우이다.
- 파일이 같은 경우 생기는 문제점을 알아보자.

    - `git merge --abort` 를 해서 오류가 생긴 merge를 삭제할 수도 있다.

    - `auto merge`의 순기능
    
    `test` 브랜치에서 test.txt 파일을 생성한 후 

        function b(){} 

    라는 코드를 입력한다. 그 다음 `master` 브랜치에서 `git merge test`를 한 다음, 다시 test.txt 파일에서 윗줄에 코드를 추가한다.

        function a(){}
        function b(){}

    `git commit` 한 다음 다시 `test`브랜치로 돌아와
    
        function b(){}
        function c(){}

    아랫줄에 위와 같이 코드를 추가한 후, 커밋하고, `master`브랜치로 돌아와 `git merge test`를 한다. 그럼 경고창이 뜨는데, 이때 :wq를 누르면 
    
        function a(){}
        function b(){}
        function c(){}

    와 같이 순서를 지키면서 auto merge 된다.

