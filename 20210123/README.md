## 20210123 TIL - `git reset`의 종류

git 에는 세 단계가 있다.

- working directory / working tree / working copy
- index / staging area / cache
- repository / history / tree

다음의 예시를 통해 알아보자. 처음 a. txt라는 파일을 생성하여 첫 줄에 'init'이라고 쓴 뒤 `git add`하고 `git commit`한다. 그 뒤 첫 줄을 수정하여 'repository' 라고 쓴 뒤, `git add`하고 `git commit`을 한다. 그 다음, 첫 줄을 'index' 라고 수정한 뒤 `git add`만을 한다. 마지막으로 'working copy'라고 덮어쓴 뒤 아무 것도 수행하지 않는다.

그럼 차례대로, repository 에는 'repository'라는 내용이, staging area 에는 'index'라는 내용이, working directory 에는 'working copy'라는 내용이 남아있는 셈이다.

### 1. `git reset --soft`

`git log`를 확인해보면 다음과 같다.

```
$ git log --oneline
1383f04 (HEAD -> master) 2
fd1de3a 1
```

여기서 `git reset --soft fd1d`를 하여 첫 번째 커밋으로 돌아가보자. 그럼 어떻게 될까? repostory 에 'init'이 담겨지게 된다. 그러나 working directory 와 staging area 는 그대로이다.

- 참고하면 좋을 명령어
  `git log -p`를 insertion과 deletion 을 각각 확인할 수 있다.
  `git diff`를 하면 working copy의 내용과 index의 내용을 비교할 수 있다.

  ```
  diff --git a/a.txt b/a.txt
  index 9015a7a..1116dba 100644
  --- a/a.txt
  +++ b/a.txt
  @@ -1 +1 @@
  -index     #index의 내용
  +working copy     #working copy의 내용
  ```

확인이 끝났기 때문에, 다시 `git reset ORIG_HEAD`를 해준다. 하지만 그냥 하면 자동으로 --mixed의 결과가 되어 index 까지 바뀌는 일이 벌어진다. 따라서 대신 `git reset --soft ORIG_HEAD`를 한다.



### 2. `git reset --mixed` (= `git reset`)

```
$ git reset --mixed fd1d
Unstaged changes after reset:
M       a.txt

$ git diff
diff --git a/a.txt b/a.txt
index b1b7161..1116dba 100644
--- a/a.txt
+++ b/a.txt
@@ -1 +1 @@
-init
+working copy
```

`git reset --mixed fd1d`를 하여 첫 커밋으로 돌아가면 index 에는 'init'이 들어왔고 working copy에는 'workiing copy'가 그대로 들어가있다.



### 3. `git reset --hard`

현재 커밋을 하기 전이지만 수정한 모든 내용을 취소하고 지난 커밋으로 돌아가고 싶다면 쓰기 좋은 명령어이다. 또한 뒤에 커밋 해시 없이 `git reset --hard`만을 사용한다면, 현재 수정된 (git add 여부와 관계 없이) 모든 내용을 없애고 최신 커밋으로 돌아간다.

``` 
$ git reset --hard
HEAD is now at fd1de3a 1
```

이후 `git status`를 해보면 아무 변경사항이 없다고 뜬다. 이때, working directory, index, repository 모두 'init'이라는 내용을 담고 있게 된다.



#### 궁금증:

`git reset --hard ORIG_HEAD`를 하여 바로 직전 단계로 돌아갈 순 있지만, 한 번 더 사용해도 그 전으로 돌아가지지는 않는다. `git reflog`를 하여 커밋 해시를 찾아 돌아가는 방법 외로, 두 번 이상 돌아가는 명령어는 없을까?