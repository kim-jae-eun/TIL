### Today I will try to practice
- commit
- branch
- checkout (상대참조/절대참조)

*ref: https://learngitbranching.js.org/?locale=ko*

1. master 브랜치에서 newImage 라는 새로운 브랜치를 생성해, 파일을 수정한 뒤 `merge`한다.
2. newImage 브랜치와 master 브랜치를 `rebase` 한다.
    
    참고로 `git checkout -b newImage` 를 하면 생성과 체크아웃이 동시에 된다.
3. 커밋간 이동을 할 때 상대참조 하는 법: 한 커밋 위로 움직이려면 `^`를, 한번에 여러 커밋 위로 가려면 `~<num>`을 사용한다.

    `git branch -f master <Hash>` 를 하면 브랜치가 해당 커밋으로 옮겨지는 것 같다.