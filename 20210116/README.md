## 20210116 TIL

### Git Interactive Rebase

커밋의 순서를 바꿀 수 있다. `git rebase -i <수정을 시작할 커밋의 이전 커밋>`를 사용하며 UI창으로 가져올(또는 순서를 바꿀) 커밋을 선택할 수 있다. 이때는 `pick`을 사용한다.

예시)

1. README.md 추가
2. a.txt 추가
3. b.txt 추가
4. c.txt 추가

그 이후 `git rebase -i Head~3`를 해보면



```
pick 01ef866 add a.txt
pick 480ca45 add b.txt
pick b17e827 add c.txt

# Rebase 87e8f4c..b17e827 onto 87e8f4c (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.

```

와 같은 interactive 창이 뜨고, 여기서 `insert`를 눌러 `pick`자리를 수정해주면 된다.