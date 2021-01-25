### 오늘 배울 명령어 `git stash`
> master 브랜치에서 a 파일을 만든 다음, 새롭게 test 브랜치에서 a 파일을 수정하였다고 하자. 그런데 커밋하기에는 아직 수정이 덜 끝나서 애매해서 커밋은 안 하고 단지 master 브랜치를 `git checkout` 하려 하는데, `git status`를 해 보니 test 브랜치에서 수정한 것이 master 브랜치에까지 영향을 미친다. 이런 상황에서 쓰일 수 있는 명령어가 `git stash`이다. 변경사항을 임시로 저장하고, 이전 커밋으로 reset 해도 stash가 남아 있어 저장사항을 되돌릴 수 있다.
- `git stash` : 현재 수정사항을 stash 한다.
- `git stash apply` : 가장 최신 stash된 상태로 되돌린다.
- `git stash list` : stash 목록을 확인한다.
- `git stash drop` : 가장 최신 stash를 목록에서 지운다.
- `git stash pop` : 가장 최신 stash를 되돌림과 동시에 목록에서 지운다. ==`git stash apply; git stash drop;`

*주의사항: `git stash`를 쓸 수 있는 파일은 최소한 `tracked`되어야 한다. 파일을 처음 생성 후 `git add`를 해 주어야 `git stash`를 사용할 수 있다.