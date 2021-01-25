## 이전 커밋으로 되돌리기: `git reset`

이전 커밋으로 되돌리기, 다시 되돌아오기. 이미 알고 있는 명령어지만 다시금 학습해본다. 

1. `git reset`  
실제로 사용시에는 `git reset --hard <커밋 해시번호>`를 사용한다.  
예시를 보도록 하자.
    ```
    vim a.txt # a.txt 만들고 즉시 입력 가능, 'a'라는 행 추가
    git add a.txt
    git commit -m 1
    ...
    vim a. txt # 이후 반복하여 'd'가 입력된 4번째 행까지 추가
    git commit -m 4
    ```
    이후 `git log --oneline`를 하여 커밋 이름을 따고 나서
    ```
    957b5f1 (HEAD -> master) 4
    aa4ad94 3
    293f174 2
    627b11e 1
    ```
    `git reset --hard aa4a`를 해주면 a, b, c 세 행만 있는 파일이 저장된 상태로 돌아간다.  
    원래대로 되돌아가려면  
    `git reset --hard OIRG_HEAD` 를 해주면 된다.

    ### 중요하게 알아두면 좋을 명령어
    `git reflog`:  `git reset`으로 이동한 커밋들과 관계 없이 전체 커밋 로그를 볼 수 있다.
    ```
    $ git reflog
    957b5f1 (HEAD -> master) HEAD@{0}: reset: moving to ORIG_HEAD
    aa4ad94 HEAD@{1}: reset: moving to aa4a
    957b5f1 (HEAD -> master) HEAD@{2}: commit: 4
    aa4ad94 HEAD@{3}: commit: 3
    293f174 HEAD@{4}: commit: 2
    627b11e HEAD@{5}: commit (initial): 1
    ```

2. `git checkout`  
역시 익히 알고 있는 명령어이다.  `git checkout <브랜치명>` 뿐 아니라 직접적으로 커밋간 이동을 할 수 있다. `git checkout <커밋 해시번호>` 로 사용한다. 그때 헤드는 브랜치 이름이 아닌 커밋 해시를 가리키고 있다. 돌아올 때는 원래 헤드가 향하고 있든 브랜치 이름으로 `checkout`한다.