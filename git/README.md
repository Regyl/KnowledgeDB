# Introduction
Git is a distributed version control system (distributed VCS).

# Content
1. [SVN](#svn)
   1. [Git VS SVN](#git-vs-svn)
2. [Concepts](#concepts)
3. [Commands](#commands)
   1. [git cherry pick](#git-cherry-pick)
   2. [git revert](#git-revert)
   3. [git merge](#git-merge)
   4. [git rebase](#git-rebase)
      1. [merge VS rebase](#git-merge-vs-git-rebase)
   5. [git stash](#git-stash)
   6. [git squash](#git-squash)

## SVN
As git, but centralized (centralized VCS).

### Git VS SVN
- GIT распределяется, а SVN - нет. Другими словами, если есть несколько разработчиков работающих с репозиторием у каждого на локальной машине будет ПОЛНАЯ копия этого репозитория. Разумеется есть и где-то и центральная машина, с которой можно клонировать репозиторий. Это напоминает SVN. Основной плюс в том, что если вдруг у вас нет доступа к интернету, сохраняется возможность работать с репозиторием. Потом только один раз сделать синхронизацию и все остальные разработчики получат поолную историю.
- GIT сохраняет метаданные изменений, а SVN целые файлы. Это экономит место и время.
- Система создания branches, versions и прочее в GIT и SVN отличаются значительно. В GIT проще переключатся с ветки на ветку, делать merge между ними. В общем GIT я нахожу немного проще и удобнее, но бывают конечно иногда сложности. Но где их не бывает?

## Concepts
**Links:**
1. 
## Commands

### git cherry pick
Команда git cherry-pick берёт изменения, вносимые одним коммитом, 
и пытается повторно применить их в виде нового коммита в текущей ветке. 
Эта возможность полезна в ситуации, когда нужно забрать парочку 
коммитов из другой ветки, а не сливать ветку целиком со всеми внесенными в нее изменениями.
![img.png](img.png)

### git revert

### git merge

### git rebase

#### git merge VS git rebase

### git stash

- git stash apply

### git squash